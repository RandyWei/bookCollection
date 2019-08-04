//
//  BookScannerViewController.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/4.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookScannerViewController.h"
#import "BookScannerView.h"

@interface BookScannerViewController ()
@property(strong,nonatomic)BookScannerView *scannerView;
@end

@implementation BookScannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initNavigation];
    [self initSubViews];
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

-(void)initSubViews{
    [self initCamera];
    [self initScannerView];
    [self initTip];
}

-(void)initCamera{}
-(void)initScannerView{
    self.scannerView = [[BookScannerView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) rectSize:CGSizeMake(230.0f, 230.0f) offsetY:-43.0f];
    self.scannerView.backgroundColor = [UIColor clearColor];
    self.scannerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.scannerView];
    
    [self.scannerView startAnimation];
}
-(void)initTip{
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,self.view.bounds.size.height - ((self.view.bounds.size.height - 230.0f)/2) + 20.0f, self.view.bounds.size.width, 10.0f)];
    [tipLabel setText:@"将条形码放入输入框内，即可自动扫描"];
    [tipLabel setTextColor:[UIColor whiteColor]];
    [tipLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:tipLabel];
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