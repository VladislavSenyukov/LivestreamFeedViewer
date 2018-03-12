//
//  NSDate+Additions.m
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import "NSDate+Additions.h"

@implementation NSDate (Additions)

+ (instancetype)dateFromString:(NSString*)dateString format:(NSString*)format {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = format;
    return [dateFormatter dateFromString:dateString];
}

- (NSString *)outputStringWithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = format;
    return [dateFormatter stringFromDate:self];
}

@end
