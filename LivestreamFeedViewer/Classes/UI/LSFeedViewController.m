//
//  LSFeedViewController.m
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 07.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import "LSFeedViewController.h"
#import "LSDefinitions.h"
#import "LSFeedViewModelBuilder.h"
#import "LSFeedTableViewCell.h"

@interface LSFeedViewController () <UITableViewDataSource>
@property (nonatomic, strong) LSFeedItemsViewModel *feedViewModel;
@property (weak, nonatomic) IBOutlet UITableView *feedTableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation LSFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFeedViewModel];
    self.feedTableView.rowHeight = UITableViewAutomaticDimension;
    self.feedTableView.estimatedRowHeight = 135;
}

#pragma mark - Private

- (void)setupFeedViewModel {
    LSFeedViewModelBuilder *builder = [[LSFeedViewModelBuilder alloc] initWithBaseURLString:LSBaseServiceURLString];
    LSFeedItemsViewModel *model = [builder buildFeedItemsModelAtPath:LSFeedPath];
    __weak __typeof(self) wself = self;
    model.onDidUpdateLoading = ^(BOOL loading) {
        wself.feedTableView.hidden = loading;
        loading ? [wself.spinner startAnimating] : [wself.spinner stopAnimating];
    };
    model.onDidLoadFeed = ^{
        [wself.feedTableView reloadData];
    };
    model.feedFilterBlock = ^BOOL(NSObject<LSFeedEventContainable> *item) {
        return item.type == LSFeedEventType_Status;
    };
    [model load];
    self.feedViewModel = model;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.feedViewModel feedItemsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSFeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LSFeedTableViewCell identifier]];
    if ([cell isKindOfClass:[LSFeedTableViewCell class]]) {
        cell.viewModel = [self.feedViewModel feedCellViewModelAtIndexPath:indexPath];
    }
    return cell;
}

@end
