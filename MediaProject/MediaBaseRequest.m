//
//  MediaBaseRequest.m
//  MediaProject
//
//  Created by CLT on 16/5/23.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "MediaBaseRequest.h"

@implementation MediaBaseRequest

- (NSString *)appendingDotaAllAnchorsUrl
{
    NSString *returnUrl = [Base_Url stringByAppendingString:Dota_AllAnchors_Url];
    return returnUrl;
}

- (NSString *)appendingDotaSignleAnchorVediosUrl
{
    NSString *returnUrl = [Base_Url stringByAppendingString:Dota_SignleAnchor_Vedios_Url];
    return returnUrl;
}

- (NSString *)appendingDotaSignleVedioUrl
{
    NSString *returnUrl = [Base_Url stringByAppendingString:Dota_Signle_Viedio_Url];
    return returnUrl;
}

/*
 拼接请求所有 lol 主播列表的 url
 */
- (NSString *)appendingLoLAllAnchorsUrl
{
    NSString *returnUrl = [Base_Url stringByAppendingString:LOL_AllAnchors_Url];
    return returnUrl;
}

/*
 拼接请求单个 lol 主播视频的 url
 */
- (NSString *)appendingLoLSignleAnchorVediosUrl
{
    NSString *returnUrl = [Base_Url stringByAppendingString:LOL_SignleAnchor_Vedios_Url];
    return returnUrl;
}

/*
 拼接请求 lol 视频的 url
 */
- (NSString *)appendingLoLSignleVedioUrl
{
    NSString *returnUrl = [Base_Url stringByAppendingString:LOL_Signle_Video_Url];
    return returnUrl;
}

@end
