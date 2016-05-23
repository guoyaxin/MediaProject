//
//  ViewController.m
//  MediaProject
//
//  Created by CLT on 16/5/20.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "ViewController.h"
#import "MediaRequest.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"mediaProject start");
//    NetWorkRequest *base = [[NetWorkRequest alloc] init];
//    [base test];
//    [base test:@"" para:nil response:^(NSDictionary *dic, NSError *error) {
//        
//    }];
//    [base test:^(NSDictionary *dic, NSError *error) {
//        
//    }];
    NSLog(@"%@",LOL_SignleAnchor_Vedios_Url(123));
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
