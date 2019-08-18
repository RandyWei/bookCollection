//
//  AuthorDao.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BaseDao.h"
#import "BookAuthor.h"

NS_ASSUME_NONNULL_BEGIN

@interface AuthorDao : BaseDao
+(long long)insertModel:(BookAuthor*)model withDataBase:(FMDatabase*)db;
@end

NS_ASSUME_NONNULL_END
