//
//  EntityDao.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "EntityDao.h"

@implementation EntityDao
+ (long long)insertModel:(BookEntity *)model withDataBase:(FMDatabase *)db{
    BOOL suc = [db executeUpdate:@"insert into TB_BOOK_ENTITY(doubanId,isbn10,isbn13,title,doubanUrl,image,publisher,pubdate,price,summary,author_intro) VALUES(?,?,?,?,?,?,?,?,?,?,?)",@(model.doubanId),model.isbn10,model.isbn13,model.title,model.doubanUrl,model.image,model.publisher,model.pubdate,model.price,model.summary,model.author_intro];
    if (suc) {
        return [db lastInsertRowId];
    }else{
        return 0;
    }
}
+ (BOOL)deleteModelWithId:(long long)id withDataBase:(nonnull FMDatabase *)db{
    BOOL suc = [db executeUpdate:@"delete FROM TB_BOOK_ENTITY where id = ?",@(id)];
    return suc;
}
+ (BookEntity *)queryModelByDoubanId:(long long)doubanId withDataBase:(FMDatabase *)db{
    FMResultSet *s = [db executeQuery:@"select * from TB_BOOK_ENTITY where doubanId = ?",@(doubanId)];
    if ([s next]) {
        BookEntity *entity = [[BookEntity alloc]initWithFMResultSet:s];
        return entity;
    }
    return nil;
}
+ (NSArray<BookEntity *> *)queryAllModelsWithDataBase:(FMDatabase *)db{
    NSMutableArray *array = [@[] mutableCopy];
    FMResultSet *s = [db executeQuery:@"select * from TB_BOOK_ENTITY"];
    while ([s next]) {
        BookEntity *entity = [[BookEntity alloc]initWithFMResultSet:s];
        [array addObject:entity];
    }
    [s close];
    return array;
}
@end
