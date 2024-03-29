//
//  BookCollectionViewController.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/24.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookCollectionViewController.h"
#import "BookEntity.h"
#import "BookListCollectionViewCell.h"
#import "BookListCollectionViewCell+BookEntity.h"
#import "BookListService.h"

@interface BookCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(strong,nonatomic)UICollectionView *collectionView;
@property(strong,nonatomic)NSArray<BookEntity*>* bookEntities;

@end

@implementation BookCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCollectionView];
    [self initData];
}

-(void)viewWillAppear:(BOOL)animated{
    [self initData];
}

-(void)initData{
    self.bookEntities = [[BookListService getAllBookEntities] mutableCopy];
    [self.collectionView reloadData];
}


-(void)initCollectionView{
    
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置collectionView滚动方向
    //[layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //该方法也可以设置itemSize
    
    static int ninimumInteritemSpacing = 0;
    int frameWidth = (CGRectGetWidth(self.view.frame) - ninimumInteritemSpacing * 2 )/3;
    int frameHeight =frameWidth * 7 / 5 + 10;
    
    [layout setItemSize:CGSizeMake((CGRectGetWidth(self.view.frame) - ninimumInteritemSpacing * 2 )/3 , frameHeight)];
    [layout setMinimumInteritemSpacing:ninimumInteritemSpacing];
    
    //这里为什么用self.view.bounds self.view.frame
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) collectionViewLayout:layout];
    collectionView.backgroundColor = UIColorFromRGB(0xf9f9f9);
    collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    //3.注册collectionViewCell
    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    [collectionView registerClass:[BookListCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
    self.collectionView = collectionView;
    [self.view addSubview:self.collectionView];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identifier = @"cellId";
    BookListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    BookEntity *entity = [self.bookEntities objectAtIndex:indexPath.row];
    [cell configureWithBookEntity:entity];
    
    return cell;
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.bookEntities.count;
}




@end
