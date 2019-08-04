//
//  BookScannerViewController.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/4.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookScannerViewController.h"

@interface BookScannerViewController ()

@end

@implementation BookScannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigation];

}


- (void)initNavigation{
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    UIButton *backButton = [[UIButton alloc]init];
    [backButton setImage:[UIImage imageNamed:@"back-button"] forState:UIControlStateNormal];
    [backButton sizeToFit];
    
    [backButton addTarget:self action:@selector(didTabBackButton:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    
    
    UIButton *flashButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [flashButton setImage:[UIImage imageNamed:@"light-off"] forState:UIControlStateNormal];
    [flashButton setImage:[UIImage imageNamed:@"light-on"] forState:UIControlStateSelected];
    [flashButton sizeToFit];
    
    [flashButton addTarget:self action:@selector(didTapFlashButton:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:flashButton];
}

-(void)didTabBackButton:(UIButton*) button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didTapFlashButton:(UIButton*)button{
    button.selected = !button.selected;
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
