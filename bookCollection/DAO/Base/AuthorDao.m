//
//  AuthorDao.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "AuthorDao.h"

@implementation AuthorDao
+(long long)insertModel:(BookAuthor*)model withDataBase:(FMDatabase*)db{
    BOOL suc = [db executeUpdate:@"insert into TB_BOOK_AUTHOR(bookId,name) VALUES(?,?)",@(model.bookId),model.name];
    if (suc) {
        return [db lastInsertRowId];
    }else{
        return 0;
    }
}
+ (NSArray<BookAuthor *> *)queryModelsWithBookId:(long long)bookId withDataBase:(FMDatabase *)db{
    NSMutableArray *array = [@[] mutableCopy];
    FMResultSet *s = [db executeQuery:@"select * from TB_BOOK_AUTHOR where bookId = ?",@(bookId)];
    while ([s next]) {
        BookAuthor *author = [[BookAuthor alloc]initWithFMResultSet:s];
        [array addObject:author];
    }
    [s close];
    return array;
}
@end
