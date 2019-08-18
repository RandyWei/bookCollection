//
//  BaseDao.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BaseDao.h"

@implementation BaseDao
+(long long)insertModel:(BookBaseModel*)model withDataBase:(FMDatabase*)db{
    NSString *msg = [NSString stringWithFormat:@"%s is not implemented for the class %@",sel_getName(_cmd),self];
    @throw [NSException exceptionWithName:@"BookDaoMethodException" reason:msg userInfo:nil];
}
@end
