//
//  BookListCollectionViewCell+BookEntity.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/24.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookListCollectionViewCell+BookEntity.h"
#import <UIImageView+WebCache.h>
#import "BookEntity.h"

@implementation BookListCollectionViewCell (BookEntity)
- (void)configureWithBookEntity:(BookEntity *)bookEntity{
    self.titleLabel.text = bookEntity.title;
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:bookEntity.image]];
}
@end
