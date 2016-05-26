//
//  AuthorModel.h
//  MediaProject
//
//  Created by CLT on 16/5/25.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "BaseModel.h"

@interface AuthorModel : BaseModel
//是否可以观看
@property (nonatomic, strong) NSString *watchable;
//主播名字（标题）
@property (nonatomic, strong) NSString *name;
//优酷id
@property (nonatomic, strong) NSString *youku_id;
//优酷主页
@property (nonatomic, strong) NSString *url;
//日期
@property (nonatomic, strong) NSString *detail;
//主播id
@property (nonatomic, strong) NSString *authorId;
//排名
@property (nonatomic, strong) NSString *pop;
//头像
@property (nonatomic, strong) NSString *icon;
@end
