//
//  LSFeedKeys.h
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#ifndef LSFeedKeys_h
#define LSFeedKeys_h

static NSString *const LSFeedKey = @"feed";
static NSString *const LSFeedDataKey = @"data";
static NSString *const LSFeedEventTypeKey = @"type";
static NSString *const LSFeedEventIdKey = @"event_id";
static NSString *const LSFeedEventTextKey = @"text";
static NSString *const LSFeedEventCreatedAtKey = @"created_at";
static NSString *const LSFeedEventUpdatedAtKey = @"updated_at";
static NSString *const LSFeedEventPublishedAtKey = @"publish_at";
static NSString *const LSFeedEventViewsCountKey = @"views";
static NSString *const LSFeedEventLikesCountKey = @"likes";
static NSString *const LSFeedEventCommentsCountKey = @"comments";

static NSString *const LSFeedItemCountableKey = @"total";

static NSString *const LSFeedTypeStatusKey = @"status";
static NSString *const LSFeedTypeVideoKey = @"video";



#endif /* LSFeedKeys_h */
