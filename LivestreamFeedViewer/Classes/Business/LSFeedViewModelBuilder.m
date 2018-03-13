//
//  LSFeedViewModelBuilder.m
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import "LSFeedViewModelBuilder.h"
#import "LSFeedFetcher.h"

@interface LSFeedViewModelBuilder ()
@property (nonatomic, strong) LSFeedFetcher *fetcher;
@end

@implementation LSFeedViewModelBuilder

- (instancetype)initWithBaseURLString:(NSString *)baseUrlString {
    self = [super init];
    _fetcher = [[LSFeedFetcher alloc] initWithBaseURLString:baseUrlString];
    return self;
}

- (LSFeedItemsViewModel *)buildFeedItemsModelAtPath:(NSString *)path {
    LSFeedItemsViewModel *feedViewModel = [[LSFeedItemsViewModel alloc] initWithFeedFetcher:self.fetcher feedPath:path];
    return feedViewModel;
}

@end
