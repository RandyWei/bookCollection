//
//  BookListTableViewController.m
//  bookCollection
//
//  Created by Wei on 2019/8/19.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookListTableViewController.h"
#import "BookEntity.h"
#import "BookListService.h"
#import "BookListTableViewCell.h"
#import "BookListTableViewCell+BookEntity.h"
#import "BookDetailService.h"

@interface BookListTableViewController ()
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)NSMutableArray<BookEntity*> *bookEntities;
@end

@implementation BookListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
    [self initData];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self initData];
}

-(void)initTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    tableView.backgroundColor = UIColorFromRGB(0xf9f9f9);
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.tableFooterView = [UIView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    
    [self.view addSubview:tableView];
}

-(void)initData{
    self.bookEntities = [[BookListService getAllBookEntities] mutableCopy];
    [self.tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bookEntities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"bookListTableViewCell";
    BookListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell==nil) {
        cell = [[BookListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    BookEntity *entity = [self.bookEntities objectAtIndex:indexPath.row];
    
    [cell configureWithBookEntity:entity];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BookEntity *entity = [self.bookEntities objectAtIndex:indexPath.row];
        BOOL suc = [BookDetailService unFavBook:entity.id];
        if (suc) {
            [tableView beginUpdates];
            [self.bookEntities removeObject:entity];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [tableView endUpdates];
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"取消收藏";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
