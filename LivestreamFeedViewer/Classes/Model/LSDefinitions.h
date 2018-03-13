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

// Formats
static NSString *const LSInputDateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSZ";
static NSString *const LSOutputDateFormat = @"dd MMM yyyy, HH:mm";

// URLs
static NSString *const LSBaseServiceURLString = @"http://api.new.livestream.com";
static NSString *const LSFeedPath = @"accounts/volvooceanrace/events/leg5";

// Errors
static NSErrorDomain const LSErrorDomainNetwork = @"LSErrorDomainNetwork";
static NSInteger const LSErrorCodeNetworkServiceNotConfigured = 1000;
static NSInteger const LSErrorCodeNetworkWrongResponse = 1001;

#endif /* LSDefinitions_h */
