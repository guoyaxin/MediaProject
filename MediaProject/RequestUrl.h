//
//  RequestUrl.h
//  MediaProject
//
//  Created by CLT on 16/5/23.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#ifndef RequestUrl_h
#define RequestUrl_h

//baseUrl：所有url 的前面公共部分
#define Base_Url @"http://api.dotaly.com/"

//所有 dota 主播的 url
#define Dota_AllAnchors_Url @"api/v1/authors?iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0"
//这里要加主播id的参数和limit限制数的参数
#define Dota_SignleAnchor_Vedios_Url @"api/v1/shipin/latest?&iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0"
//根据vedio id 和 type 来获取视频连接，这里得传入视频的类型和vid
#define Dota_Signle_Viedio_Url @"api/v1/getvideourl?iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0"

//所有lol 主播的url
#define LOL_AllAnchors_Url @"lol/api/v1/authors?iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E"
//这里要加主播id的参数和limit限制数的参数
#define LOL_SignleAnchor_Vedios_Url @"lol/api/v1/shipin/latest?&iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E&jb=0"
//根据vedio id 和 type 来获取视频连接，这里得传入视频的类型和vid
#define LOL_Signle_Video_Url @"lol/api/v1/getvideourl?iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E&jb=0"

//屏幕的宽度
#define WindownWidth [[UIScreen mainScreen] bounds].size.width
//屏幕的高度
#define WindowHeight [[UIScreen mainScreen] bounds].size.height

#endif /* RequestUrl_h */
