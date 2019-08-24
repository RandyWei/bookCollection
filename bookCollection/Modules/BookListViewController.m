//
//  BookListViewController.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/4.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookListViewController.h"
#import "BookListTableViewController.h"
#import "BookCollectionViewController.h"

typedef NS_ENUM(NSInteger, BookListMode){
    BookListModeTableView,
    BookListModeCollectionView
};

@interface BookListViewController ()
@property(assign,nonatomic)BookListMode mode;
@end

@implementation BookListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    self.mode = BookListModeTableView;
     [self switchToMode];
}

-(void)initNavigationBar{
    self.navigationItem.title = @"我的藏书";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"列表" style:UIBarButtonItemStylePlain target:self action:@selector(didTapSwitchButton:)];
}

-(void)didTapSwitchButton:(UIBarButtonItem*)barButtonItem{
    
    [self.childViewControllers makeObjectsPerformSelector:@selector(willMoveToParentViewController:) withObject:nil];
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    [self.childViewControllers makeObjectsPerformSelector:@selector(didMoveToParentViewController:) withObject:nil];
    
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
    
    if (self.mode == BookListModeTableView) {
        self.mode = BookListModeCollectionView;
        barButtonItem.title = @"表格";
    }else{
        self.mode = BookListModeTableView;
        barButtonItem.title = @"列表";
    }
    [self switchToMode];
}

-(void)switchToMode{
    if (self.mode==BookListModeTableView) {
        BookListTableViewController *controller = [[BookListTableViewController alloc]init];
        [controller willMoveToParentViewController:self];
        [self addChildViewController:controller];
        [self.view addSubview:controller.view];
        controller.view.frame = self.view.bounds;
        [controller didMoveToParentViewController:self];
    }else{
        BookCollectionViewController *controller = [[BookCollectionViewController alloc]init];
        [controller willMoveToParentViewController:self];
        [self addChildViewController:controller];
        [self.view addSubview:controller.view];
        controller.view.frame = self.view.bounds;
        [controller didMoveToParentViewController:self];
    }
}

@end
