//
//  MediaRequest.m
//  MediaProject
//
//  Created by CLT on 16/5/23.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "MediaRequest.h"

@implementation MediaRequest


- (void)getDotaAllAnchorListSucess:(ResponseSuccess)sucessResponse failure:(ResponseFail)failureResponse
{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestDataWithUrl:[self appendingAllDotaAnchorsUrl] para:nil sucessResponse:sucessResponse failureResponse:failureResponse];
}

- (void)getSignleAnchorVediosWithAuthor:(NSString *)author vedioLimit:(int)limit success:(ResponseSuccess)successResponse failure:(ResponseFail)failureResponse
{
    NSString *limitStr = [NSString stringWithFormat:@"%d", limit];
    NSDictionary *paraDic = @{@"author":author,
                              @"limit":limitStr
                              };
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestDataWithUrl:[self appendingSignleAnchorVediaUrl] para:paraDic sucessResponse:successResponse failureResponse:failureResponse];
}

- (void)getDotaVedioWithType:(NSString *)type vedioId:(NSString *)vedioId success:(ResponseSuccess)successResponse failure:(ResponseFail)failureResponse
{
    NSDictionary *paraDic = @{@"type":type,
                          @"vid":vedioId
                          };
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestDataWithUrl:[self appendingDotaVedioUrl] para:paraDic sucessResponse:successResponse failureResponse:failureResponse];
}

@end
