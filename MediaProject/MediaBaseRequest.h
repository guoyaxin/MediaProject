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
- (NSString *)appendingAllDotaAnchorsUrl;

/*
 拼接请求单个 Dota 主播视频的 Url
 */
- (NSString *)appendingSignleAnchorVediaUrl;

/*
 拼接请求 Dota 视频的Url
 */
- (NSString *)appendingDotaVedioUrl;


@end
