//
//  MediaRequest.m
//  MediaProject
//
//  Created by CLT on 16/5/23.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "MediaRequest.h"
#import "AuthorModel.h"
#import "VedioModel.h"
#import "VedioDetailModel.h"

@implementation MediaRequest


- (void)getDotaAllAnchorListSuccess:(SuccessArrResult)sucessResponse failure:(FailureResult)failureResponse
{
    [self getAllAnchorsListWithUrl:[self appendingDotaAllAnchorsUrl] success:sucessResponse failur:failureResponse];
}

- (void)getDotaSignleAnchorVediosWithAuthor:(NSString *)author vedioLimit:(int)limit success:(SuccessArrResult)successResponse failure:(FailureResult)failureResponse
{
    [self getAnchorVediosListWithUrl:[self appendingDotaSignleAnchorVediosUrl] authorId:author vedioLimit:limit success:successResponse failure:failureResponse];
}

- (void)getDotaSignleVedioWithType:(NSString *)type vedioId:(NSString *)vedioId success:(SuccessDicResult)successResponse failure:(FailureResult)failureResponse
{
    [self getSignleVedioWithUrl:[self appendingDotaSignleVedioUrl]  type:type vedioId:vedioId success:successResponse failure:failureResponse];
}

/*
 获取所有 lol 主播的列表
 */
- (void)getLoLAllAnchorsListSuccess:(SuccessArrResult)successResponse failure:(FailureResult)failureResponse
{
    [self getAllAnchorsListWithUrl:[self appendingLoLAllAnchorsUrl] success:successResponse failur:failureResponse];
}

/*
 获取单个 lol 主播的视频列表
 */
- (void)getLoLSignleAnchorVediosWithAuthor:(NSString *)author vedioLimit:(int)limit success:(SuccessArrResult)successResponse failure:(FailureResult)failureReponse
{
    [self getAnchorVediosListWithUrl:[self appendingLoLSignleAnchorVediosUrl] authorId:author vedioLimit:limit success:successResponse failure:failureReponse];
}

/*
 获取单个 lol 视频信息
 */
- (void)getLoLSignleVedioWithType:(NSString *)type vedioId:(NSString *)vedioId success:(ResponseSuccess)successResponse failure:(ResponseFail)failureResponse
{
    [self getSignleVedioWithUrl:[self appendingLoLSignleVedioUrl]  type:type vedioId:vedioId success:successResponse failure:failureResponse];
}

//根据不同的url来获得主播列表
- (void)getAllAnchorsListWithUrl:(NSString *)url success:(SuccessArrResult)successResponse failur:(FailureResult)failureResponse
{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestDataWithUrl:url para:nil sucessResponse:^(NSDictionary *dic) {
        NSArray *authors = [dic objectForKey:@"authors"];
        NSMutableArray *resultAuthors = [NSMutableArray arrayWithCapacity:10];
        for (NSDictionary *tmp in authors) {
            AuthorModel *model = [[AuthorModel alloc] init];
            [model setPropertiesWithJsonDic:tmp];
            if (model.pop.intValue == -1) {
                model.pop = @0;
            }
            [resultAuthors addObject:model];
        }
        successResponse(resultAuthors);
    } failureResponse:^(NSError *error) {
        failureResponse(error);
    }];
}

//获得主播所有视频列表
- (void)getAnchorVediosListWithUrl:(NSString *)url authorId:(NSString *)authorId vedioLimit:(int)limit success:(SuccessArrResult)successResponse failure:(FailureResult)failureResponse
{
    NSString *limitStr = [NSString stringWithFormat:@"%d", limit];
    NSDictionary *paraDic = @{@"author":authorId,
                              @"limit":limitStr
                              };
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestDataWithUrl:url para:paraDic sucessResponse:^(NSDictionary *dic) {
        NSArray *vedios = [dic objectForKey:@"vedios"];
        NSMutableArray *resultVedios = [NSMutableArray array];
        for (NSDictionary *tmp in vedios) {
            VedioModel *model = [[VedioModel alloc] init];
            [model setPropertiesWithJsonDic:tmp];
            [resultVedios addObject:model];
        }
        successResponse(resultVedios);
    } failureResponse:^(NSError *error) {
        failureResponse(error);
    }];

}

//获得单个视频信息
- (void)getSignleVedioWithUrl:(NSString *)url type:(NSString *)type vedioId:(NSString *)vedioId success:(SuccessDicResult)successResponse failure:(FailureResult)failureResponse
{
    NSDictionary *paraDic = @{@"type":type,
                              @"vid":vedioId
                              };
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestDataWithUrl:url para:paraDic sucessResponse:^(NSDictionary *dic) {
        successResponse(dic);
    } failureResponse:^(NSError *error) {
        failureResponse(error);
    }];

}

@end
