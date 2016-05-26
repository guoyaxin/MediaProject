//
//  MediaRequest.h
//  MediaProject
//
//  Created by CLT on 16/5/23.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "MediaBaseRequest.h"

typedef void(^SuccessArrResult)(NSArray *arr);
typedef void(^SuccessDicResult)(NSDictionary *dic);
typedef void(^FailureResult)(NSError *error);

@interface MediaRequest : MediaBaseRequest
/*
 获取所有 Dota 主播的列表
 */
- (void)getDotaAllAnchorListSuccess:(SuccessArrResult)sucessResponse failure:(FailureResult)failureResponse;

/*
 获取单个 Dota 主播的视频列表
 */
- (void)getDotaSignleAnchorVediosWithAuthor:(NSString *)author vedioLimit:(int)limit success:(SuccessArrResult)successResponse failure:(FailureResult)failureResponse;

/*
 获取单个 Dota 视频的信息
 */
- (void)getDotaSignleVedioWithType:(NSString *)type vedioId:(NSString *)vedioId success:(SuccessDicResult)successResponse failure:(FailureResult)failureResponse;

/*
 获取所有 lol 主播的列表
 */
- (void)getLoLAllAnchorsListSuccess:(SuccessArrResult)successResponse failure:(FailureResult)failureResponse;

/*
 获取单个 lol 主播的视频列表
 */
- (void)getLoLSignleAnchorVediosWithAuthor:(NSString *)author vedioLimit:(int)limit success:(SuccessArrResult)successResponse failure:(FailureResult)failureReponse;

/*
 获取单个 lol 视频信息
 */
- (void)getLoLSignleVedioWithType:(NSString *)type vedioId:(NSString *)vedioId success:(SuccessDicResult)successResponse failure:(FailureResult)failureResponse;

@end
