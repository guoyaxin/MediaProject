//
//  NetWorkBase.m
//  MediaProject
//
//  Created by CLT on 16/5/20.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "NetWorkRequest.h"

@implementation NetWorkRequest

//- (void)test:(NSString *)url para:(NSDictionary *)dic response:(DefaultResponse)response
//{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager GET:@"http://api.dotaly.com/api/v1/authors?iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"progress = uplodateProgress = %@", downloadProgress);
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"responseOjbect = %@", responseObject);
//        response(responseObject, nil);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"error = %@", error);
//        response(nil, error);
//    }];
//}
- (void)requestDataWithUrl:(NSString *)url para:(NSDictionary *)para sucessResponse:(ResponseSuccess)sucessResponse failureResponse:(ResponseFail) failureResponse
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:para progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        sucessResponse(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureResponse(error);
    }];
}

//- (void)test:(aaa)response
//{
//    
//}

@end
