//
//  LSFeedItem.m
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import "LSFeedItem.h"
#import "LSFeedKeys.h"
#import "NSDate+Additions.h"

@implementation LSFeedItem

@synthesize type = _type, eventId = _eventId, text = _text, createdAt = _createdAt, updatedAt = _updatedAt, publishedAt = _publishedAt, viewsCount = _viewsCount;
@synthesize comments, likes;

#pragma mark - Public

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    _type = [self feedTypeFromString:dic[LSFeedEventTypeKey]];
    NSDictionary *dataDic = dic[LSFeedDataKey];
    if (dataDic) {
        _eventId = [dataDic[LSFeedEventIdKey] unsignedIntegerValue];
        _text = dataDic[LSFeedEventTextKey];
        _createdAt = [NSDate dateFromString:dataDic[LSFeedEventCreatedAtKey] format:LSInputDateFormat];
        _updatedAt = [NSDate dateFromString:dataDic[LSFeedEventUpdatedAtKey] format:LSInputDateFormat];
        _publishedAt = [NSDate dateFromString:dataDic[LSFeedEventPublishedAtKey] format:LSInputDateFormat];
        _viewsCount = [dataDic[LSFeedEventViewsCountKey] unsignedIntegerValue];
    }
    return self;
}

#pragma mark - Private

- (LSFeedEventType)feedTypeFromString:(NSString*)typeString {
    LSFeedEventType type = LSFeedEventType_Unknown;
    if ([typeString isEqualToString:LSFeedTypeStatusKey]) {
        type = LSFeedEventType_Status;
    } else if ([typeString isEqualToString:LSFeedTypeVideoKey]) {
        type = LSFeedEventType_Video;
    }
    return type;
}

@end
