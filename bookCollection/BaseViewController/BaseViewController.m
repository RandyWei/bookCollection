//
//  BaseViewController.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/10.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self ajustNavigator];
}


#pragma mark - Navigation config
-(void)ajustNavigator{
    //是否隐藏导航栏底部的线
    if([self shouldShowShadowImage]){
        [self.navigationController.navigationBar setShadowImage:nil];
    }else{
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    }
    
    //是否使用自定义背景(透明)
    if ([self navigationBarBackgroundImage]) {
        [self.navigationController.navigationBar setBackgroundImage:[self navigationBarBackgroundImage] forBarMetrics:UIBarMetricsDefault];
    }else{
        self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x009d82);
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    }
    
}

-(UIImage*)navigationBarBackgroundImage{
    return nil;
}

-(BOOL)shouldShowShadowImage{
    return NO;
}

-(BOOL)shouldHideBottomWhenPushed{
    return NO;
}



@end
