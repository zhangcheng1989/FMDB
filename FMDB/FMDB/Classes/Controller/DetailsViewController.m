//
//  DetailsViewController.m
//  FMDB
//
//  Created by zhangcheng on 16/1/23.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"moveRow" object:self];
}

@end
