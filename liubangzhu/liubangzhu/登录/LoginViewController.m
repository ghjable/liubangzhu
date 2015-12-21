//
//  LoginViewController.m
//  liubangzhu
//
//  Created by able on 15/12/21.
//  Copyright © 2015年 able. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:btn];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)BtnClick
{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate getRootViewController];
}

@end
