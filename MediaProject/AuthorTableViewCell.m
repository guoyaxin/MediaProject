//
//  AuthorTableViewCell.m
//  MediaProject
//
//  Created by CLT on 16/6/1.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "AuthorTableViewCell.h"

@implementation AuthorTableViewCell

- (void)awakeFromNib {
    self.headerView.layer.masksToBounds = YES;
    self.headerView.layer.cornerRadius = self.headerView.bounds.size.width / 2.0;
}

- (void)setAuthorModel:(AuthorModel *)authorModel
{
    _authorModel = authorModel;
    [self.headerView setImageWithURL:[NSURL URLWithString:authorModel.icon] placeholderImage:nil];
    self.nameLabel.text = authorModel.name;
    self.dateLabel.text = authorModel.detail;
    self.rangeLabel.text = [NSString stringWithFormat:@"排名：%@", authorModel.pop];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
