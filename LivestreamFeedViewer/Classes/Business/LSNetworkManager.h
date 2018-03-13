//
//  LSNetworkManager.h
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSNetworkManager : NSObject

@property (nonatomic, readonly) NSURL* baseURL;

- (instancetype)initWithBaseURL:(NSURL*)baseURL;
- (void)performGETRequestAt:(NSString*)path completion:(void(^)(NSDictionary *resultDic, NSError *error))completion;

@end
