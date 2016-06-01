//
//  RootTabBarViewController.m
//  MediaProject
//
//  Created by CLT on 16/5/26.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "YXTabBar.h"

@interface RootTabBarViewController ()<YXTabBarDelegate>

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"tabbar";
    self.tabBar.hidden = YES;
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"first_normal"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"first_selected"] forState:UIControlStateSelected];
    btn1.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, 0);
    [btn1 setTitle:@"视频" forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn1 setTitleEdgeInsets:UIEdgeInsetsMake(30, -55, 0, 0)];
    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"second_normal"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"second_selected"] forState:UIControlStateSelected];
    btn2.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, 0);
    [btn2 setTitle:@"我的" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn2 setTitleEdgeInsets:UIEdgeInsetsMake(30, -55, 0, 0)];
    [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    
    NSArray *buttonItems = @[btn1, btn2];
    
    YXTabBar *mytabBar = [[YXTabBar alloc] init];
    mytabBar.buttonItems = buttonItems;
    mytabBar.myDelegate = self;
    [self.view addSubview:mytabBar];
    self.selectedIndex = mytabBar.tabBarSelectedIndex;
}

- (void)YXTabBarBtnClicked:(YXTabBar *)tabBar
{
    self.selectedIndex = tabBar.tabBarSelectedIndex;
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
