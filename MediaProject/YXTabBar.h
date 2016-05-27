//
//  YXTabBar.h
//  MediaProject
//
//  Created by CLT on 16/5/26.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YXTabBar;

@protocol YXTabBarDelegate

- (void)YXTabBarBtnClicked:(YXTabBar *)tabBar;

@end

@interface YXTabBar : UITabBar

- (id)init;

@property (nonatomic, assign) NSUInteger tabBarSelectedIndex;
@property (nonatomic, strong) NSArray *buttonItems;
@property (nonatomic, strong) UIButton *currentItem;
@property (nonatomic, assign) id<YXTabBarDelegate>myDelegate;

@end
