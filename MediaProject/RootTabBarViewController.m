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
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn1 setImage:[UIImage imageNamed:@"first_normal"] forState:UIControlStateNormal];
//    [btn1 setImage:[UIImage imageNamed:@"first_selected"] forState:UIControlStateSelected];
//    btn1.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, 0);
//    [btn1 setTitle:@"视频" forState:UIControlStateNormal];
//    btn1.titleLabel.font = [UIFont systemFontOfSize:12];
//    [btn1 setTitleEdgeInsets:UIEdgeInsetsMake(30, -55, 0, 0)];
//    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [btn1 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
//    
//    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn2 setImage:[UIImage imageNamed:@"second_normal"] forState:UIControlStateNormal];
//    [btn2 setImage:[UIImage imageNamed:@"second_selected"] forState:UIControlStateSelected];
//    btn2.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, 0);
//    [btn2 setTitle:@"我的" forState:UIControlStateNormal];
//    btn2.titleLabel.font = [UIFont systemFontOfSize:12];
//    [btn2 setTitleEdgeInsets:UIEdgeInsetsMake(30, -55, 0, 0)];
//    [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [btn2 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
//    
//    NSArray *buttonItems = @[btn1, btn2];
//    
//    YXTabBar *mytabBar = [[YXTabBar alloc] init];
//    mytabBar.buttonItems = buttonItems;
//    mytabBar.myDelegate = self;
//    [self.view addSubview:mytabBar];
    
    
    
    
    //创建CGContextRef
    UIGraphicsBeginImageContext(self.view.bounds.size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    //创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    
    //绘制Path
    CGRect rect = CGRectInset(self.view.bounds, 30, 30);
    CGPathMoveToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetHeight(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(rect), CGRectGetHeight(rect) * 2 / 3);
    CGPathCloseSubpath(path);
    
    //绘制渐变
    [self drawLinearGradient:gc path:path startColor:[UIColor greenColor].CGColor endColor:[UIColor redColor].CGColor];
    
    //注意释放CGMutablePathRef
    CGPathRelease(path);
    
    
    //从Context中获取图像，并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    [self.view addSubview:imgView];
}

- (void)YXTabBarBtnClicked:(YXTabBar *)tabBar
{
    self.selectedIndex = tabBar.tabBarSelectedIndex;
}

//- (void)drawLinearGradient:(CGContextRef)context

- (void)drawLinearGradient:(CGContextRef)context
                      path:(CGPathRef)path
                startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    
    CGRect pathRect = CGPathGetBoundingBox(path);
    
    //具体方向可根据需求修改
    CGPoint startPoint = CGPointMake(CGRectGetMidX(pathRect), CGRectGetMinY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(pathRect), CGRectGetMaxY(pathRect));
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
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
