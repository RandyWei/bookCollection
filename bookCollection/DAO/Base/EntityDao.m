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
@end
