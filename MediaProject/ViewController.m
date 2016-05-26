//
//  ViewController.m
//  MediaProject
//
//  Created by CLT on 16/5/20.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "ViewController.h"
#import "MediaRequest.h"
#import "AuthorModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MediaRequest *mediaQuest = [[MediaRequest alloc] init];
    [mediaQuest getDotaAllAnchorListSuccess:^(NSArray *arr) {
        NSLog(@"arr = %@", arr);
    } failure:^(NSError *error) {
        NSLog(@"error = %@", error);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
