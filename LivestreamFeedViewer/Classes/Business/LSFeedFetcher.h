//
//  LSFeedFetcher.h
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSFeedProtocols.h"

@interface LSFeedFetcher : NSObject <LSFeedFetchable>

@property (nonatomic, readonly) NSString *baseUrlString;

- (instancetype)initWithBaseURLString:(NSString*)baseUrlString;

@end
