//
//  BookScannerViewController.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/4.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookScannerViewController.h"
#import "BookScannerView.h"
#import <AFNetworking/AFNetworking.h>
#import "BookEntity.h"
#import "BookDetailViewController.h"

@interface BookScannerViewController ()
@property(strong,nonatomic)BookScannerView *scannerView;
@end

@implementation BookScannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initNavigation];
    [self initSubViews];
    
    [self fetchBookWithISBN:@"9787115314581"];
}


- (void)initNavigation{
    
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

-(BOOL)shouldShowShadowImage{
    return NO;
}

-(UIImage *)navigationBarBackgroundImage{
    return [UIImage new];
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

-(void)fetchBookWithISBN:(NSString*)ISBN{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.douban.com/v2/book/isbn/%@?apikey=0df993c66c0c636e29ecbb5344252a4a",ISBN]];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error!=nil) {
            NSLog(@"error:%@",error);
        }else{
            NSLog(@"%@",responseObject);
            BookEntity* bookEntity = [[BookEntity alloc]initWithDictionary:responseObject];
            BookDetailViewController* bookDetailViewController = [[BookDetailViewController alloc]init];
            bookDetailViewController.bookEntity = bookEntity;
            
            [self.navigationController pushViewController:bookDetailViewController animated:YES];
        }
    }];
    
    [dataTask resume];
    
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
