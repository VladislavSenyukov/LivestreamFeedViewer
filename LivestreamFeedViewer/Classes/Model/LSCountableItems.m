//
//  LSCountableItems.m
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import "LSCountableItems.h"
#import "LSFeedKeys.h"

@implementation LSCountableItem

@synthesize count = _count;

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    _count = [dic[LSFeedItemCountableKey] unsignedIntegerValue];
    return self;
}

@end

@implementation LSLikes
@end

@implementation LSComments
@end
