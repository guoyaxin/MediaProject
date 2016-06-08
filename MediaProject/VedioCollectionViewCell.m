//
//  VedioCollectionViewCell.m
//  MediaProject
//
//  Created by CLT on 16/6/2.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "VedioCollectionViewCell.h"

@implementation VedioCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    [_titleLabel sizeToFit];
}

- (void)setVedioModel:(VedioModel *)vedioModel
{
    _vedioModel = vedioModel;
    [_backgroundImageView setImageWithURL:[NSURL URLWithString:vedioModel.thumb] placeholderImage:nil];
    _timeLengthLabel.text = [NSString stringWithFormat:@"%@", vedioModel.time];
    _dateLabel.text = vedioModel.date;
    _titleLabel.text = vedioModel.title;
}

//0:隐藏；1：显示
- (void)setType:(int)type
{
    _type = type;
    if (_type == 0) {
        _playBtn.hidden = NO;
    }
    else {
        _playBtn.hidden = YES;
    }
}

- (IBAction)playBtnClicked:(UIButton *)sender {
    if (_delegate) {
        [_delegate vedioCollectionViewPlayBtnClicked:self];
    }
}

@end
