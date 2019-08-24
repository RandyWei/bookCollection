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
    self.contentView.backgroundColor = UIColorFromRGB(0xeeeeee);
    
    self.coverImageView = [[UIImageView alloc]init];
    self.coverImageView.backgroundColor = [UIColor whiteColor];
    self.coverImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.coverImageView];
    
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_coverImageView);
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[_coverImageView(==50)]" options:NSLayoutFormatAlignAllTop metrics:nil views:views]];
    
    [self.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[_coverImageView(==70)]" options:NSLayoutFormatAlignAllTop metrics:nil views:views]];
}

@end
