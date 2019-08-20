//
//  BookListService.m
//  bookCollection
//
//  Created by Wei on 2019/8/19.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookListService.h"
#import <FMDB/FMDB.h>
#import "BookDBHelper.h"
#import "EntityDao.h"
#import "AuthorDao.h"
#import "TagDao.h"
#import "TranslatorDao.h"
#import "BookAuthor.h"

@implementation BookListService

+ (NSArray<BookEntity *> *)getAllBookEntities{
    FMDatabase *db = [FMDatabase databaseWithPath:[BookDBHelper dbPath]];
    if (![db open]) {
        return 0;
    }
    NSArray *bookEntities = [EntityDao queryAllModelsWithDataBase:db];
    for (BookEntity *entity in bookEntities) {
        entity.authors = [AuthorDao queryModelsWithBookId:entity.id withDataBase:db];
        entity.translators = [TranslatorDao queryModelsWithBookId:entity.id withDataBase:db];
        entity.tags = [TagDao queryModelsWithBookId:entity.id withDataBase:db];
    }
    [db close];
    return bookEntities;
    
}

@end
