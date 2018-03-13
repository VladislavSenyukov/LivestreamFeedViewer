//
//  LSFeedViewModelBuilder.h
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSFeedItemsViewModel.h"

@interface LSFeedViewModelBuilder : NSObject

- (instancetype)initWithBaseURLString:(NSString*)baseUrlString;
- (LSFeedItemsViewModel*)buildFeedItemsModelAtPath:(NSString*)path;

@end
