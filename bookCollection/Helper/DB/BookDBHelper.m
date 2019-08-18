//
//  BookDBHelper.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookDBHelper.h"
#import <FMDB/FMDB.h>

@implementation BookDBHelper

+ (NSString*) dbFolder{
    NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docsDir stringByAppendingString:@"/db"];
    return path;
}
+ (NSString*) dbPath{
    NSString *path = [[[self class] dbFolder] stringByAppendingString:@"/book.sqlite"];
    return path;
    
}
+ (void)buildDataBase{
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:[[self class] dbFolder]]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:[[self class] dbFolder] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    FMDatabase *db = [FMDatabase databaseWithPath:[[self class] dbPath]];
    if (![db open]) {
        return;
    }
    
    BOOL success = [[self class] createTableWithDB:db];
    if (success) {
        NSLog(@"init sql done");
    }else{
        NSLog(@"init sql error");
    }
    [db close];
}

+ (BOOL)createTableWithDB:(FMDatabase*)db{
    BOOL suc = YES;
    NSArray *array = [[self class] createTableSqls];
    for (NSInteger i = 0; i < [array count]; i++) {
        NSString *sql = [array objectAtIndex:i];
        if (![db executeUpdate:sql]) {
            suc = NO;
            break;
        }
    }
    return suc;
}

+ (NSArray*)createTableSqls{
    return @[
             @"CREATE TABLE `TB_BOOK_ENTITY` (\
             `id` INTEGER PRIMARY KEY AUTOINCREMENT,\
             `doubanId` INTEGER UNIQUE, \
             `isbn10` TEXT, \
             `isbn13` TEXT, \
             `title` TEXT, \
             `doubanUrl` TEXT, \
             `image` TEXT, \
             `publisher` TEXT, \
             `pubdate` TEXT, \
             `price` TEXT, \
             `summary` TEXT, \
             `author_intro` TEXT \
             );",
             @"CREATE TABLE `TB_BOOK_TRANSLATOR` (\
             `bookId` INTEGER,\
             `name` TEXT\
             );",
             @"CREATE TABLE `TB_BOOK_TAG` (\
             `bookId` INTEGER,\
             `name` TEXT,\
             `count` INTEGER\
             );",
             @"CREATE TABLE `TB_BOOK_AUTHOR` (\
             `bookId` INTEGER,\
             `name` TEXT\
             );"
             ];
}

@end
