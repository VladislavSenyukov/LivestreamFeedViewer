//
//  LSFeedItemsViewModel.m
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import "LSFeedItemsViewModel.h"
#import "NSDate+Additions.h"

@interface LSFeedItemsViewModel ()
@property (nonatomic, strong) NSObject<LSFeedFetchable> *feedFetcher;
@property (nonatomic, strong) NSString *feedPath;
@property (nonatomic, strong) NSMutableArray *feedItems;
@property (nonatomic, strong) NSArray<LSFeedCellViewModel*> *cellModels;
@property (nonatomic, assign) BOOL loading;
@end

@implementation LSFeedItemsViewModel

#pragma mark - Public

- (instancetype)initWithFeedFetcher:(NSObject<LSFeedFetchable> *)feedFetcher feedPath:(NSString *)feedPath {
    self = [super init];
    if ([feedFetcher conformsToProtocol:@protocol(LSFeedFetchable)]) {
        _feedFetcher = feedFetcher;
    }
    _feedPath = feedPath;
    _feedItems = @[].mutableCopy;
    _loading = NO;
    return self;
}

- (void)load {
    __weak __typeof(self) wself = self;
    self.loading = YES;
    [self.feedFetcher fetchFeedAtPath:self.feedPath completion:^(NSArray<NSObject<LSFeedEventContainable> *> *feedItems, NSError *error) {
        for (NSObject<LSFeedEventContainable> *feedItem in feedItems) {
            if (!wself.feedFilterBlock || (wself.feedFilterBlock && wself.feedFilterBlock(feedItem))) {
                [wself.feedItems addObject:feedItem];
            }
        }
        wself.cellModels = [wself createCellViewModelsFromFeedItems:wself.feedItems];
        wself.loading = NO;
    }];
}

#pragma mark - Private

- (NSArray<LSFeedCellViewModel*>*)createCellViewModelsFromFeedItems:(NSArray<NSObject<LSFeedEventContainable>*>*)feedItems {
    NSMutableArray *cellModels = @[].mutableCopy;
    for (NSObject<LSFeedEventContainable> *feedItem in feedItems) {
        LSFeedCellViewModel *cellViewModel = [LSFeedCellViewModel new];
        cellViewModel.text = feedItem.text;
        cellViewModel.createdAt = [feedItem.createdAt outputStringWithFormat:LSOutputDateFormat];
        cellViewModel.updatedAt = [feedItem.updatedAt outputStringWithFormat:LSOutputDateFormat];
        cellViewModel.publishedAt = [feedItem.publishedAt outputStringWithFormat:LSOutputDateFormat];
        cellViewModel.viewsCount = feedItem.viewsCount;
        cellViewModel.likesCount = feedItem.likes.count;
        cellViewModel.commentsCount = feedItem.comments.count;
        [cellModels addObject:cellViewModel];
    }
    return [NSArray arrayWithArray:cellModels];
}

- (void)setLoading:(BOOL)loading {
    if (_loading != loading) {
        _loading = loading;
        if (self.onDidUpdateLoading) {
            self.onDidUpdateLoading(loading);
        }
    }
}

@end
