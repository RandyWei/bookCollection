//
//  TagDao.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BaseDao.h"
#import "BookTag.h"
NS_ASSUME_NONNULL_BEGIN

@interface TagDao : BaseDao
+(long long)insertModel:(BookTag*)model withDataBase:(FMDatabase*)db;
@end

NS_ASSUME_NONNULL_END
