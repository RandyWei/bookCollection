//
//  EntityDao.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BaseDao.h"
#import "BookEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntityDao : BaseDao
+(long long)insertModel:(BookEntity*)model withDataBase:(FMDatabase*)db;
@end

NS_ASSUME_NONNULL_END
