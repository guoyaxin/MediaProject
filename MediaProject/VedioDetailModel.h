//
//  VedioDetailModel.h
//  MediaProject
//
//  Created by CLT on 16/5/26.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "BaseModel.h"

@interface VedioDetailModel : BaseModel
//视频链接url
@property (nonatomic, strong) NSString *url;
//返回的消息
@property (nonatomic, strong) NSString *message;
//返回码
@property (nonatomic, strong) NSString *code;

@end
