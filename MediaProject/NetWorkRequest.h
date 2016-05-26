//
//  NetWorkBase.h
//  MediaProject
//
//  Created by CLT on 16/5/20.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void(^ResponseSuccess)(NSDictionary *dic);
typedef void(^ResponseFail)(NSError *error);

@interface NetWorkRequest : NSObject

@property (nonatomic, copy) ResponseSuccess successResponse;
@property (nonatomic, copy) ResponseFail failResponse;

- (void)requestDataWithUrl:(NSString *)url para:(NSDictionary *)para sucessResponse:(ResponseSuccess)sucessResponse failureResponse:(ResponseFail) failureResponse;

@end
