//
//  LSFeedCellViewModel.h
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSFeedCellViewModel : NSObject
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *publishedAt;
@property (nonatomic, assign) NSUInteger viewsCount;
@property (nonatomic, assign) NSUInteger likesCount;
@property (nonatomic, assign) NSUInteger commentsCount;
@end
