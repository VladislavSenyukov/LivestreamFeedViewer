//
//  LSFeedItemsViewModel.h
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSFeedProtocols.h"
#import "LSFeedCellViewModel.h"

@interface LSFeedItemsViewModel : NSObject

@property (nonatomic, readonly) NSObject<LSFeedFetchable> *feedFetcher;
@property (nonatomic, readonly) NSString *feedPath;
@property (nonatomic, readonly) NSInteger feedItemsCount;
@property (nonatomic, copy) BOOL(^feedFilterBlock)(NSObject<LSFeedEventContainable>* item);
@property (nonatomic, copy) void(^onDidUpdateLoading)(BOOL loading);
@property (nonatomic, copy) void(^onDidLoadFeed)(void);

- (instancetype)initWithFeedFetcher:(NSObject<LSFeedFetchable>*)feedFetcher feedPath:(NSString*)feedPath;
- (void)load;
- (LSFeedCellViewModel*)feedCellViewModelAtIndexPath:(NSIndexPath*)indexPath;

@end
