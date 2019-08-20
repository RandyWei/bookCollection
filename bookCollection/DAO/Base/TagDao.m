//
//  TagDao.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "TagDao.h"

@implementation TagDao
+ (long long)insertModel:(BookTag *)model withDataBase:(FMDatabase *)db{
    BOOL suc = [db executeUpdate:@"insert into TB_BOOK_TAG(bookId,name,count)  VALUES(?,?,?)",@(model.bookId),model.name,@(model.count)];
    if (suc) {
        return [db lastInsertRowId];
    }else{
        return 0;
    }
}
+ (NSArray<BookTag *> *)queryModelsWithBookId:(long long)bookId withDataBase:(FMDatabase *)db{
    NSMutableArray *array = [@[] mutableCopy];
    FMResultSet *s = [db executeQuery:@"select * from TB_BOOK_TAG where bookId = ?",@(bookId)];
    while ([s next]) {
        BookTag *model = [[BookTag alloc]initWithFMResultSet:s];
        [array addObject:model];
    }
    [s close];
    return array;
}
@end
