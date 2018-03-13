//
//  ViewController.m
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 07.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import "ViewController.h"
#import "LSDefinitions.h"
#import "LSFeedViewModelBuilder.h"

@interface ViewController ()
@property (nonatomic, strong) LSFeedItemsViewModel *feedViewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFeedViewModel];
}

#pragma mark - Private

- (void)setupFeedViewModel {
    LSFeedViewModelBuilder *builder = [[LSFeedViewModelBuilder alloc] initWithBaseURLString:LSBaseServiceURLString];
    LSFeedItemsViewModel *model = [builder buildFeedItemsModelAtPath:LSFeedPath];
    model.feedFilterBlock = ^BOOL(NSObject<LSFeedEventContainable> *item) {
        return item.type == LSFeedEventType_Status;
    };
    [model load];
    self.feedViewModel = model;
}

@end
