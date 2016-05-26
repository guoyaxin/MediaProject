//
//  VedioModel.h
//  MediaProject
//
//  Created by CLT on 16/5/26.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "BaseModel.h"

@interface VedioModel : BaseModel
//视频截图
@property (nonatomic, strong) NSString *thumb;
//主播id
@property (nonatomic, strong) NSString *author;
//视频题目
@property (nonatomic, strong) NSString *title;
//时长
@property (nonatomic, strong) NSString *time;
//视频日期
@property (nonatomic, strong) NSString *date;
//视频id
@property (nonatomic, strong) NSString *vedioId;

@end
