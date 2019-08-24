//
//  BookListCollectionViewCell+BookEntity.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/24.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookListCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN
@class BookEntity;
@interface BookListCollectionViewCell (BookEntity)
-(void)configureWithBookEntity:(BookEntity*)bookEntity;
@end

NS_ASSUME_NONNULL_END
