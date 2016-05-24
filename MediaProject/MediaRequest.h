//
//  MediaRequest.h
//  MediaProject
//
//  Created by CLT on 16/5/23.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "MediaBaseRequest.h"

@interface MediaRequest : MediaBaseRequest
/*
 获取所有 Dota 主播的列表
 */
- (void)getDotaAllAnchorListSuccess:(ResponseSuccess)sucessResponse failure:(ResponseFail)failureResponse;

/*
 获取单个 Dota 主播的视频列表
 */
- (void)getDotaSignleAnchorVediosWithAuthor:(NSString *)author vedioLimit:(int)limit success:(ResponseSuccess)successResponse failure:(ResponseFail)failureResponse;

/*
 获取单个 Dota 视频的信息
 */
- (void)getDotaSignleVedioWithType:(NSString *)type vedioId:(NSString *)vedioId success:(ResponseSuccess)successResponse failure:(ResponseFail)failureResponse;

/*
 获取所有 lol 主播的列表
 */
- (void)getLoLAllAnchorsListSuccess:(ResponseSuccess)successResponse failure:(ResponseFail)failureResponse;

/*
 获取单个 lol 主播的视频列表
 */
- (void)getLoLSignleAnchorVediosWithAuthor:(NSString *)author vedioLimit:(int)limit success:(ResponseSuccess)successResponse failure:(ResponseFail)failureReponse;

/*
 获取单个 lol 视频信息
 */
- (void)getLoLSignleVedioWithType:(NSString *)type vedioId:(NSString *)vedioId success:(ResponseSuccess)successResponse failure:(ResponseFail)failureResponse;

@end
