//
//  BookEntity.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/11.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookEntity.h"

@implementation BookEntity

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    
    BookEntity* bookEntity = [[[self class]alloc]init];
    
    bookEntity.doubanId = [[dict objectForKey:@"id"] longLongValue];
    bookEntity.isbn10 = [dict objectForKey:@"isbn10"];
    bookEntity.isbn13 = [dict objectForKey:@"isbn13"];
    bookEntity.title = [dict objectForKey:@"title"];
    bookEntity.doubanUrl = [dict objectForKey:@"alt"];
    bookEntity.image = [[dict objectForKey:@"images"] objectForKey:@"large"];
    bookEntity.publisher = [dict objectForKey:@"publisher"];
    bookEntity.pubdate = [dict objectForKey:@"pubdate"];
    bookEntity.price = [dict objectForKey:@"price"];
    bookEntity.summary = [ dict objectForKey:@"summary"];
    bookEntity.author_intro = [ dict objectForKey:@"author_intro"];
    
    
    return bookEntity;
}

-(id)copyWithZone:(NSZone*) zone{
    BookEntity* bookEntity = [[[self class]allocWithZone:zone]init];
    
    bookEntity.id = self.id;
    bookEntity.doubanId = self.doubanId;
    bookEntity.isbn10 = [self.isbn10 copy];
    bookEntity.isbn13 = [self.isbn13 copy];
    bookEntity.title = [self.title copy];
    bookEntity.doubanUrl = [self.doubanUrl copy];
    bookEntity.image = [self.image copy];
    bookEntity.publisher = [self.publisher copy];
    bookEntity.pubdate = [self.pubdate copy];
    bookEntity.price = [self.price copy];
    bookEntity.summary = [ self.summary copy];
    bookEntity.author_intro = [self.author_intro copy];
    bookEntity.authors = [self.authors copy];
    bookEntity.translators = [self.translators copy];
    bookEntity.tags = [self.tags copy];
    
    return bookEntity;
}

@end
