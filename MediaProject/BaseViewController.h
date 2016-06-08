//
//  BaseViewController.h
//  MediaProject
//
//  Created by CLT on 16/5/26.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaRequest.h"
#import "RootTabBarViewController.h"

typedef enum : NSUInteger {
    VedioType_Dota,
    VedioType_LOL
} VedioType;

@interface BaseViewController : UIViewController

@property (strong, nonatomic) RootTabBarViewController *rootTabVC;

- (void)backLeftController;
@end
