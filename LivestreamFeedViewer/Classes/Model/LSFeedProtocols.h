//
//  LSFeedProtocols.h
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 07.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#ifndef LSFeedProtocols_h
#define LSFeedProtocols_h

#import "LSDefinitions.h"

@protocol LSDeserializable <NSObject>
- (instancetype)initWithDic:(NSDictionary *)dic;
@end

@protocol LSFeedItemCountable <LSDeserializable>
@property (nonatomic, assign) NSUInteger count;
@end

@protocol LSFeedEventContainable <LSDeserializable>
@property (nonatomic, assign) LSFeedEventType type;
@property (nonatomic, assign) NSUInteger eventId;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, strong) NSDate *publishedAt;
@property (nonatomic, assign) NSUInteger viewsCount;
@property (nonatomic, strong) NSObject<LSFeedItemCountable> *likes;
@property (nonatomic, strong) NSObject<LSFeedItemCountable> *comments;
@end

#endif /* LSFeedProtocols_h */
