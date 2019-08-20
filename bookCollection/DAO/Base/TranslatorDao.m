//
//  TranslatorDao.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "TranslatorDao.h"

@implementation TranslatorDao
+(long long)insertModel:(BookTranslator*)model withDataBase:(FMDatabase*)db{
    BOOL suc = [db executeUpdate:@"insert into TB_BOOK_TRANSLATOR(bookId,name) VALUES(?,?)",@(model.bookId),model.name];
    if (suc) {
        return [db lastInsertRowId];
    }else{
        return 0;
    }
}
+ (NSArray<BookTranslator *> *)queryModelsWithBookId:(long long)bookId withDataBase:(FMDatabase *)db{
    NSMutableArray *array = [@[] mutableCopy];
    FMResultSet *s = [db executeQuery:@"select * from TB_BOOK_TRANSLATOR where bookId = ?",@(bookId)];
    while ([s next]) {
        BookTranslator *model = [[BookTranslator alloc]initWithFMResultSet:s];
        [array addObject:model];
    }
    [s close];
    return array;
}
@end
