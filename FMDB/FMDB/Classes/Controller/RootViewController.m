//
//  RootViewController.m
//  FMDB
//
//  Created by iOS on 16/1/21.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "RootViewController.h"
#import "MainViewController.h"
#import "ProfileViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    ProfileViewController *pro = [[ProfileViewController alloc]init];
    
    [self adddViewControllerWithTitle:@"我" viewController:pro];
    
    MainViewController *mainVC = [[MainViewController alloc]init];
    
    [self adddViewControllerWithTitle:@"热门" viewController:mainVC];
}


- (void)adddViewControllerWithTitle:(NSString *)title viewController:(UIViewController *)controller{
    controller.view.backgroundColor = [UIColor colorWithRed:256/255.0 green:256/255.0 blue:256/255.0 alpha:1.0];
    
    controller.title = title;
    self.tabBar.tintColor = [UIColor orangeColor];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller];
    
    [self addChildViewController:nav];
}


@end
