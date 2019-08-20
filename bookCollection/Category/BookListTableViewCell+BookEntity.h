//
//  BookListTableViewCell+BookEntity.h
//  bookCollection
//
//  Created by Wei on 2019/8/19.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookListTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN
@class BookEntity;
@interface BookListTableViewCell (BookEntity)
-(void)configureWithBookEntity:(BookEntity*)bookEntity;
@end

NS_ASSUME_NONNULL_END
