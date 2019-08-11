//
//  BookAuthor.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/11.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookAuthor.h"

@implementation BookAuthor


-(instancetype)initWithDictionary:(NSDictionary *)dict{
    BookAuthor* bookAuthor = [[[self class]alloc]init];
    
    bookAuthor.bookId = [[dict objectForKey:@"bookId"] longLongValue];
    bookAuthor.name = [ dict objectForKey:@"name"];
    
    return bookAuthor;
}

-(id)copyWithZone:(NSZone*) zone{
    BookAuthor* bookAuthor = [[[self class]allocWithZone:zone]init];
    
    bookAuthor.bookId = self.bookId;
    bookAuthor.name = [ self.name copy];
    
    return bookAuthor;
}

@end
