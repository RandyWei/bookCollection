//
//  BookAuthor.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/11.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookAuthor : BookBaseModel

@property(assign,nonatomic)long long bookId;
@property(copy,nonatomic)NSString* name;

@end

NS_ASSUME_NONNULL_END
