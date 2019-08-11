//
//  BaseNavigationController.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/10.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BaseNavigationController.h"
#import "BaseViewController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x009d82)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([viewController isKindOfClass:BaseViewController.class]) {
        ((BaseViewController*)viewController).hidesBottomBarWhenPushed = [(BaseViewController*)viewController shouldHideBottomWhenPushed];
    }else{
        
    }
    [super pushViewController:viewController animated:YES];
}

@end
