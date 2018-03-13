//
//  LSFeedTableViewCell.h
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSFeedCellViewModel.h"

@interface LSFeedTableViewCell : UITableViewCell

+ (NSString*)identifier;
@property (nonatomic, strong) LSFeedCellViewModel *viewModel;

@end
