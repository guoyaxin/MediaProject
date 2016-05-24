//
//  MediaRequest.m
//  MediaProject
//
//  Created by CLT on 16/5/23.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "MediaRequest.h"

@implementation MediaRequest


- (void)getDotaAllAnchorListSuccess:(ResponseSuccess)sucessResponse failure:(ResponseFail)failureResponse
{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestDataWithUrl:[self appendingDotaAllAnchorsUrl] para:nil sucessResponse:sucessResponse failureResponse:failureResponse];
}

- (void)getDotaSignleAnchorVediosWithAuthor:(NSString *)author vedioLimit:(int)limit success:(ResponseSuccess)successResponse failure:(ResponseFail)failureResponse
{
    NSString *limitStr = [NSString stringWithFormat:@"%d", limit];
    NSDictionary *paraDic = @{@"author":author,
                              @"limit":limitStr
                              };
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestDataWithUrl:[self appendingDotaSignleAnchorVediosUrl] para:paraDic sucessResponse:successResponse failureResponse:failureResponse];
}

- (void)getDotaSignleVedioWithType:(NSString *)type vedioId:(NSString *)vedioId success:(ResponseSuccess)successResponse failure:(ResponseFail)failureResponse
{
    NSDictionary *paraDic = @{@"type":type,
                          @"vid":vedioId
                          };
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestDataWithUrl:[self appendingDotaSignleVedioUrl] para:paraDic sucessResponse:successResponse failureResponse:failureResponse];
}

/*
 获取所有 lol 主播的列表
 */
- (void)getLoLAllAnchorsListSuccess:(ResponseSuccess)successResponse failure:(ResponseFail)failureResponse
{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestDataWithUrl:[self appendingLoLAllAnchorsUrl] para:nil sucessResponse:successResponse failureResponse:failureResponse];
}

/*
 获取单个 lol 主播的视频列表
 */
- (void)getLoLSignleAnchorVediosWithAuthor:(NSString *)author vedioLimit:(int)limit success:(ResponseSuccess)successResponse failure:(ResponseFail)failureReponse
{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    NSString *limitStr = [NSString stringWithFormat:@"%d", limit];
    NSDictionary *paraDic = @{@"author":author,
                              @"limit":limitStr
                              };
    [request requestDataWithUrl:[self appendingLoLSignleAnchorVediosUrl] para:paraDic sucessResponse:successResponse failureResponse:failureReponse];
}

/*
 获取单个 lol 视频信息
 */
- (void)getLoLSignleVedioWithType:(NSString *)type vedioId:(NSString *)vedioId success:(ResponseSuccess)successResponse failure:(ResponseFail)failureResponse
{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    NSDictionary *paraDic = @{@"type":type,
                              @"vid":vedioId
                              };
    [request requestDataWithUrl:[self appendingLoLSignleVedioUrl] para:paraDic sucessResponse:successResponse failureResponse:failureResponse];
}

@end
