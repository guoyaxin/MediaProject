//
//  RootTabBarViewController.m
//  MediaProject
//
//  Created by CLT on 16/5/26.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "YXTabBar.h"

@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"视频" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"我的" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    
    NSArray *buttonItems = @[btn1, btn2];
    YXTabBar *tabBar = [[YXTabBar alloc] init];
    tabBar.buttonItems = buttonItems;
//    [self hideRealTabBar];
    NSLog(@"SELF =%d", tabBar.userInteractionEnabled);
    tabBar.userInteractionEnabled = YES;
    [self setValue:tabBar forKey:@"tabBar"];
}

- (void)hideRealTabBar
{
    for (UIView *subView in self.tabBar.subviews) {
        if ([subView isKindOfClass:[UITabBar class]]) {
            subView.hidden = YES;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
