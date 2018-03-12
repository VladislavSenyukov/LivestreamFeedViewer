//
//  LSDefinitions.h
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#ifndef LSDefinitions_h
#define LSDefinitions_h

typedef NS_ENUM(NSUInteger, LSFeedEventType) {
    LSFeedEventType_Unknown,
    LSFeedEventType_Status,
    LSFeedEventType_Video,
};

static NSString *const LSInputDateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
static NSString *const LSOutputDateFormat = @"dd MMM yyyy, HH:mm";

#endif /* LSDefinitions_h */
