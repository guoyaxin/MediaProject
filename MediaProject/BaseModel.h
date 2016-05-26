//
//  BaseModel.h
//  MediaProject
//
//  Created by CLT on 16/5/24.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface BaseModel : NSObject

- (void)setPropertiesWithJsonDic:(NSDictionary *)dic;

@end
