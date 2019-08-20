//
//  BookDetailService.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookDetailService.h"
#import <FMDB/FMDB.h>
#import "BookDBHelper.h"
#import "EntityDao.h"
#import "AuthorDao.h"
#import "TagDao.h"
#import "TranslatorDao.h"
#import "BookAuthor.h"

@implementation BookDetailService
+(long long)favBook:(BookEntity*)entity{
    
    FMDatabase *db = [FMDatabase databaseWithPath:[BookDBHelper dbPath]];
    if (![db open]) {
        return 0;
    }
    
    //保存图书
    long long bookId = [EntityDao insertModel:entity withDataBase:db];
    if (!bookId) {
        return bookId;
    }
    
    //保存作者
    [entity.authors enumerateObjectsUsingBlock:^(BookAuthor*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.bookId = bookId;
        [AuthorDao insertModel:obj withDataBase:db];
    }];
    
    //保存译者
    [entity.translators enumerateObjectsUsingBlock:^(BookTranslator*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.bookId = bookId;
        [TranslatorDao insertModel:obj withDataBase:db];
    }];
    
    //保存tag
    [entity.tags enumerateObjectsUsingBlock:^(BookTag*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.bookId = bookId;
        [TagDao insertModel:obj withDataBase:db];
    }];
    
    [db close];
    
    return bookId;
}

+ (BOOL)unFavBook:(long long)id{
    FMDatabase *db = [FMDatabase databaseWithPath:[BookDBHelper dbPath]];
    if (![db open]) {
        return 0;
    }
    BOOL result = [EntityDao deleteModelWithId:id withDataBase:db];
    return result;
}

+ (BookEntity *)searchBookEntityByDoubanId:(long long)doubanId{
    FMDatabase *db = [FMDatabase databaseWithPath:[BookDBHelper dbPath]];
    if (![db open]) {
        return 0;
    }
    BookEntity *entity = [EntityDao queryModelByDoubanId:doubanId withDataBase:db];
    [db close];
    return entity;
}
@end
