//
//  BaseModel.m
//  MediaProject
//
//  Created by CLT on 16/5/24.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (NSString *)description
{
    NSMutableString *des = [NSMutableString string];
    unsigned int count = 0;
    Ivar *members = class_copyIvarList([self class], &count);
    for (int i = 0 ; i < count; i++) {
        Ivar var = members[i];
        //变量名
        const char *memberName = ivar_getName(var);
        NSString *str = object_getIvar(self, var);
        NSString *desStr = [NSString stringWithFormat:@"{%s:%@}, ", memberName, str];
        [des appendString:desStr];
    }
    return [NSString stringWithFormat:@"{%@}", des];
}

- (void)setPropertiesWithJsonDic:(NSDictionary *)dic
{
    NSArray *allKeys = [dic allKeys];
    unsigned int count = 0;
    Ivar *members = class_copyIvarList([self class], &count);
    for (int i = 0 ; i < count; i++) {
        Ivar var = members[i];
        //变量名
        const char *memberName = ivar_getName(var);
        char *p = malloc(sizeof(memberName));
        char *memberNameStr = strcpy(p, memberName);
        for (int k = 0; k<sizeof(memberNameStr)+2;k++)
        {
            memberNameStr[k]= memberNameStr[k+1];
        }
//        NSLog(@"memberStr = %s", memberNameStr);
        
        for (int j = 0; j < allKeys.count; j++) {
            //字典的key
            NSString *key = [allKeys objectAtIndex:j];
            const char *char_content = [key cStringUsingEncoding:NSASCIIStringEncoding];
            if (strcmp(memberNameStr, char_content) == 0) {
                object_setIvar(self, var, [dic objectForKey:key]);
//                NSString *str = object_getIvar(self, var);
//                NSLog(@"str = %@", str);
            }
            else if ((strcmp("authorId", memberNameStr) == 0 || strcmp("vedioId", memberNameStr) == 0)&& strcmp("id", char_content) == 0) {
                object_setIvar(self, var, [dic objectForKey:key]);
            }
        }
        //        object_setIvar(self, var, @"hello");
        //变量类型
//        const char *memberType = ivar_getTypeEncoding(var);
//        NSLog(@"memberName = %s", memberName);
//        NSLog(@"memberType = %s", memberType);
    }
}


@end
