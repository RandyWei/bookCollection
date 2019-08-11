//
//  BookEntity.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/11.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookEntity : BookBaseModel


@property(assign ,nonatomic) long long id;

@property(assign,nonatomic)long long doubanId;

@property(copy,nonatomic)NSString* isbn10;

@property(copy,nonatomic)NSString* isbn13;

@property(copy,nonatomic)NSString* title;

@property(copy,nonatomic)NSString* doubanUrl;

@property(copy,nonatomic)NSString* image;

@property(copy,nonatomic)NSString* publisher;

@property(copy,nonatomic)NSString* pubdate;

@property(copy,nonatomic)NSString* price;

@property(copy,nonatomic)NSString* summary;

@property(copy,nonatomic)NSString* author_intro;

@property(copy,nonatomic)NSArray* authors;

@property(copy,nonatomic)NSArray* translators;

@property(copy,nonatomic)NSArray* tags;

@end

NS_ASSUME_NONNULL_END
