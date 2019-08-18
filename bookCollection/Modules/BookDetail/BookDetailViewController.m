//
//  BookDetailViewController.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/11.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookDetailViewController.h"
#import "BookAuthor.h"
#import "BookTranslator.h"
#import "BookTag.h"
#import <UIImageView+WebCache.h>
#import "BookDetailService.h"

#define kBackgroundHeight 270.5f //背景的高度
#define kNavHeight 64.0f //导航条的高度

@interface BookDetailViewController ()
@property(strong,nonatomic)UIImageView* backgroundImageView;
@end

@implementation BookDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initNavigation];
    [self initSubViews];
}

-(void)initNavigation{
    self.navigationItem.title = @"书籍详情";
}

- (UIImage *)navigationBarBackgroundImage{
    return [UIImage new];
}

- (BOOL)shouldShowShadowImage{return NO;}

- (BOOL)shouldHideBottomWhenPushed{return YES;}

-(void)initSubViews{
    [self initBackgroundView];
    [self initScrollView];
}

-(void)initBackgroundView{
    self.backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"detail-topbg"] ];
    self.backgroundImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), kBackgroundHeight);
    self.backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.backgroundImageView];
}

-(void)initScrollView{
    UIScrollView* scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, kNavHeight, CGRectGetWidth(self.view.frame), (CGRectGetHeight(self.view.frame) - kNavHeight))];
    scrollView.alwaysBounceVertical = YES;
    scrollView.delegate = self;
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:scrollView];
    
    //头部
    UIView *headerView = [[UIView alloc]init];
    headerView.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addSubview:headerView];
    
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[headerView(==206.5)]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(headerView)]];
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[headerView(==scrollView)]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(headerView,scrollView)]];
    
    //封面
    UIImageView* coverImageView = [[UIImageView alloc]init];
    coverImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [coverImageView setBackgroundColor:[UIColor whiteColor]];
    [coverImageView sd_setImageWithURL:[NSURL URLWithString:self.bookEntity.image]];
    [headerView addSubview:coverImageView];
    
    [headerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-16-[coverImageView(115)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(coverImageView)]];
    [headerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-16-[coverImageView(161)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(coverImageView)]];
    
    //标题
    UILabel* titleLabel = [[UILabel alloc]init];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    titleLabel.text = self.bookEntity.title;
    titleLabel.font = [UIFont systemFontOfSize:17.0f];
    titleLabel.textColor = [ UIColor whiteColor];
    [headerView addSubview:titleLabel];
    
    [headerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:[coverImageView]-14-[titleLabel]-(>=15)-|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(coverImageView,titleLabel)]];
    
    //详细信息
    NSMutableArray *itemsText = [@[] mutableCopy];
    
    if (self.bookEntity.authors) {
        NSString *authorList = @"";
        for (BookAuthor *author in self.bookEntity.authors) {
            authorList = [[authorList stringByAppendingString:author.name] stringByAppendingString:@" "];
        }
        [itemsText addObject:[NSString stringWithFormat:@"作者:%@",authorList]];
    }
    
    if (self.bookEntity.translators) {
        NSString *translatorList = @"";
        for (BookTranslator *translator in self.bookEntity.translators) {
            translatorList = [[translatorList stringByAppendingString: translator.name] stringByAppendingString:@" "];
        }
        [itemsText addObject:[NSString stringWithFormat:@"译者：%@",translatorList]];
    }
    
    if (self.bookEntity.publisher) {
        [itemsText addObject:[NSString stringWithFormat:@"出版社：%@",self.bookEntity.publisher]];
    }
    
    if (self.bookEntity.pubdate) {
        [itemsText addObject:[NSString stringWithFormat:@"出版年份：%@",self.bookEntity.pubdate]];
    }
    
    if (self.bookEntity.price) {
        [itemsText addObject:[NSString stringWithFormat:@"价格：%@",self.bookEntity.price]];
    }
    
    if (self.bookEntity.isbn13) {
        [itemsText addObject:[NSString stringWithFormat:@"ISBN：%@",self.bookEntity.isbn13]];
    }else if(self.bookEntity.isbn10){
        [itemsText addObject:[NSString stringWithFormat:@"ISBN：%@",self.bookEntity.isbn10]];
    }
    
    __block UILabel *lastLabel = titleLabel;
    
    [itemsText enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *itemLabel = [[UILabel alloc]init];
        itemLabel.translatesAutoresizingMaskIntoConstraints = NO;
        itemLabel.text = obj;
        itemLabel.font = [UIFont systemFontOfSize:11.0f];
        itemLabel.textColor = [UIColor whiteColor];
        [headerView addSubview:itemLabel];
        
        [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[coverImageView]-14-[itemLabel]-(>=15)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(coverImageView,itemLabel)]];
        
        [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lastLabel]-4-[itemLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(lastLabel,itemLabel)]];
        
        lastLabel = itemLabel;
    }];
    
    //收藏按钮
    UIButton *favorButton = [UIButton buttonWithType:UIButtonTypeCustom];
    favorButton.translatesAutoresizingMaskIntoConstraints = NO;
    favorButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [favorButton setBackgroundColor:[UIColor whiteColor]];
    [favorButton setTitle:@"收藏" forState:UIControlStateNormal];
    [favorButton setTitle:@"已收藏" forState:UIControlStateDisabled];
    [favorButton setTitleColor:UIColorFromRGB(0x00a25b) forState:UIControlStateNormal];
     [favorButton setTitleColor:UIColorFromRGB(0xb8b8b8) forState:UIControlStateDisabled];
    favorButton.layer.cornerRadius = 2.0f;
    [favorButton addTarget:self action:@selector(didTapFavorButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [headerView addSubview:favorButton];
    
    [headerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:[coverImageView]-14-[favorButton(==70)]" options:NSLayoutFormatAlignAllBottom metrics:nil views:NSDictionaryOfVariableBindings(coverImageView,favorButton)]];
    
    [headerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:[favorButton(==27)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(favorButton)]];
    
    //body
    UIView *bodyView = [[UIView alloc]init];
    bodyView.translatesAutoresizingMaskIntoConstraints = NO;
    bodyView.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:bodyView];
    
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bodyView(==scrollView)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(bodyView,scrollView)]];
    
    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[headerView]-0-[bodyView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(headerView,scrollView,bodyView)]];
    
    //内容简介
    UILabel *summaryLabel = [[UILabel alloc]init];
    summaryLabel.text = @"内容简介";
    summaryLabel.font = [UIFont systemFontOfSize:16.0f];
    summaryLabel.textColor = UIColorFromRGB(0x555555);
    summaryLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [bodyView addSubview:summaryLabel];
    
    //内容简介内容
    UILabel *detailLabel = [[UILabel alloc]init];
    detailLabel.numberOfLines = 0;
    detailLabel.text = self.bookEntity.summary;
    detailLabel.font = [UIFont systemFontOfSize:15.0f];
    detailLabel.textColor = UIColorFromRGB(0x999999);
    detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [bodyView addSubview:detailLabel];
    
    [bodyView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[summaryLabel]-6.5-[detailLabel]-15-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(summaryLabel,detailLabel)]];
    
    [bodyView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[summaryLabel]-15-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(summaryLabel)]];
    
    [bodyView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[detailLabel]-15-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(detailLabel)]];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //向下滚动
    if (scrollView.contentOffset.y<0) {
        self.backgroundImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), kBackgroundHeight - scrollView.contentOffset.y);
    }else{
        self.backgroundImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), kBackgroundHeight);
    }
}


-(void)didTapFavorButton:(UIButton*)button{
    long long bookId = [BookDetailService favBook:self.bookEntity];
    if (bookId>0) {
        [button setEnabled:NO];
    }
}

@end
