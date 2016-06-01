 //
//  YXTabBar.m
//  MediaProject
//
//  Created by CLT on 16/5/26.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "YXTabBar.h"

@implementation YXTabBar

- (id)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, WindowHeight - 49, WindownWidth, 49);
//        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)setButtonItems:(NSArray *)buttonItems
{
    NSUInteger count = buttonItems.count;
    for (int i = 0; i < count; i++) {
        UIButton *btn = buttonItems[i];
        btn.frame = CGRectMake(i * WindownWidth / count, 0, WindownWidth / count, self.frame.size.height);
        if (i == 0) {
            btn.selected = YES;
            self.currentItem = btn;
            self.tabBarSelectedIndex = i;
        }
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
        _buttonItems = buttonItems;
    }
}

- (void)btnClicked:(UIButton *)btn
{
    for (int i = 0; i < self.buttonItems.count; i++) {
        UIButton *b = self.buttonItems[i];
        b.selected = NO;
        if (self.buttonItems[i] == btn) {
            self.tabBarSelectedIndex = i;
        }
    }
    btn.selected = YES;
    self.currentItem = btn;
    if (_myDelegate) {
        [_myDelegate YXTabBarBtnClicked:self];
    }
}


@end
