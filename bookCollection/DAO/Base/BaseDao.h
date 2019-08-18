//
//  BaseDao.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>
#import "BookBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseDao : NSObject

+(long long)insertModel:(BookBaseModel*)model withDataBase:(FMDatabase*)db;

@end

NS_ASSUME_NONNULL_END
