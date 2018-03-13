//
//  LSFeedTableViewCell.m
//  LivestreamFeedViewer
//
//  Created by Vladislav Senyukov on 13.03.2018.
//  Copyright © 2018 Vladislav Senyukov. All rights reserved.
//

#import "LSFeedTableViewCell.h"

@interface LSFeedTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *feedTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *updatedAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *publishedAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *viewsCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *likesCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsCountLabel;
@end

@implementation LSFeedTableViewCell

+ (NSString *)identifier {
    return NSStringFromClass(self);
}

- (void)setViewModel:(LSFeedCellViewModel *)viewModel {
    if (_viewModel != viewModel) {
        _viewModel = viewModel;
        if (viewModel) {
            self.feedTextLabel.text = viewModel.text;
            self.createdAtLabel.text = viewModel.createdAt;
            self.updatedAtLabel.text = viewModel.updatedAt;
            self.publishedAtLabel.text = viewModel.publishedAt;
            self.viewsCountLabel.text = viewModel.viewsCount;
            self.likesCountLabel.text = viewModel.likesCount;
            self.commentsCountLabel.text = viewModel.commentsCount;
        }
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle =  UITableViewCellSelectionStyleNone;
}


@end
