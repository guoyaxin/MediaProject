//
//  AuthorTableViewCell.h
//  MediaProject
//
//  Created by CLT on 16/6/1.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthorModel.h"

#define AutorTableViewCell_Identify @"AutorTableViewCell_Identify"

@interface AuthorTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *headerView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) IBOutlet UILabel *rangeLabel;

@property (strong, nonatomic) AuthorModel *authorModel;

@end
