//
//  LSFeedFetcher.m
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import "LSFeedFetcher.h"
#import "LSNetworkManager.h"
#import "LSFeedKeys.h"
#import "LSFeedItem.h"
#import "LSCountableItems.h"

@interface LSFeedFetcher ()
@property (nonatomic, strong) NSString *baseUrlString;
@property (nonatomic, strong) LSNetworkManager *networkManager;
@end

@implementation LSFeedFetcher

- (instancetype)initWithBaseURLString:(NSString *)baseUrlString {
    self = [super init];
    if (baseUrlString) {
        _baseUrlString = baseUrlString;
        NSURL *baseURL = [NSURL URLWithString:baseUrlString];
        _networkManager = [[LSNetworkManager alloc] initWithBaseURL:baseURL];
    }
    return self;
}

- (void)fetchFeedAtPath:(NSString *)path completion:(void (^)(NSArray<NSObject<LSFeedEventContainable> *> *,  NSError *))completion {
    [self.networkManager performGETRequestAt:LSFeedPath completion:^(NSDictionary *resultDic, NSError *error) {
        NSMutableArray *feedItems = @[].mutableCopy;
        if (!error) {
            NSArray *feedItemDics = resultDic[LSFeedKey][LSFeedDataKey];
            for (NSDictionary *feedItemDic in feedItemDics) {
                LSFeedItem *feedItem = [[LSFeedItem alloc] initWithDic:feedItemDic];
                NSDictionary *likesDic = feedItemDic[LSFeedDataKey][LSFeedEventLikesKey];
                feedItem.likes = [[LSLikes alloc] initWithDic:likesDic];
                NSDictionary *commentsDic = feedItemDic[LSFeedDataKey][LSFeedEventCommentsKey];
                feedItem.comments = [[LSComments alloc] initWithDic:commentsDic];
                [feedItems addObject:feedItem];
            }
        }
        if (completion) {
            completion(feedItems, error);
        }
    }];
}

@end
