//
//  MediaBaseRequest.m
//  MediaProject
//
//  Created by CLT on 16/5/23.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "MediaBaseRequest.h"

@implementation MediaBaseRequest

- (NSString *)appendingAllDotaAnchorsUrl
{
    NSString *returnUrl = [Base_Url stringByAppendingString:Dota_AllAnchors_Url];
    return returnUrl;
}

- (NSString *)appendingSignleAnchorVediaUrl
{
    NSString *returnUrl = [Base_Url stringByAppendingString:Dota_SignleAnchor_Vedios_Url];
    return returnUrl;
}

- (NSString *)appendingDotaVedioUrl
{
    NSString *returnUrl = [Base_Url stringByAppendingString:Dota_Viedio_Url];
    return returnUrl;
}

@end
