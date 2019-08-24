//
//  BookListCollectionViewCell.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/24.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookListCollectionViewCell.h"

@implementation BookListCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

-(void)initSubviews{
    
    self.coverImageView = [[UIImageView alloc]init];
    self.coverImageView.backgroundColor = [UIColor whiteColor];
    self.coverImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.coverImageView];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    self.titleLabel.textColor = UIColorFromRGB(0x555555);
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.titleLabel];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_coverImageView,_titleLabel);
    
    int coverImageWidth = CGRectGetWidth(self.contentView.frame) - (15 * 2);
    int coverImageHeight = coverImageWidth * 7 / 5 ;
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-15-[_coverImageView(==%d)]",coverImageWidth] options:0 metrics:nil views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-15-[_titleLabel]-(>=15)-|"] options:0 metrics:nil views:views]];
    
    [self.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-15-[_coverImageView(==%d)]-6-[_titleLabel]",coverImageHeight] options:0 metrics:nil views:views]];
}

@end
