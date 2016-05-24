//
//  MediaBaseRequest.h
//  MediaProject
//
//  Created by CLT on 16/5/23.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"

@interface MediaBaseRequest : NSObject
/*
 拼接请求所有 Dota 主播列表的 Url
 */
- (NSString *)appendingDotaAllAnchorsUrl;

/*
 拼接请求单个 Dota 主播视频的 Url
 */
- (NSString *)appendingDotaSignleAnchorVediosUrl;

/*
 拼接请求 Dota 视频的Url
 */
- (NSString *)appendingDotaSignleVedioUrl;

/*
 拼接请求所有 lol 主播列表的 url
 */
- (NSString *)appendingLoLAllAnchorsUrl;

/*
 拼接请求单个 lol 主播视频的 url
 */
- (NSString *)appendingLoLSignleAnchorVediosUrl;

/*
 拼接请求 lol 视频的 url
 */
- (NSString *)appendingLoLSignleVedioUrl;

@end
