//
//  VediosViewController.h
//  MediaProject
//
//  Created by CLT on 16/6/2.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "BaseViewController.h"
#import "AuthorModel.h"

@interface VediosViewController : BaseViewController
@property (nonatomic, strong) AuthorModel *authorModel;
@property (nonatomic, assign) VedioType vedioType;
@end
