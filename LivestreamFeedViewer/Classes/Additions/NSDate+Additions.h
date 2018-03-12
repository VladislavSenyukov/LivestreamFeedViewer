//
//  NSDate+Additions.h
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Additions)

+ (instancetype)dateFromString:(NSString*)dateString format:(NSString*)format;
- (NSString*)outputStringWithFormat:(NSString*)format;

@end
