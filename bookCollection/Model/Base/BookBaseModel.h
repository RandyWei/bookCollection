//
//  BookBaseModel.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/11.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookBaseModel : NSObject

-(instancetype)initWithDictionary:(NSDictionary*)dict;

-(instancetype)initWithFMResultSet:(FMResultSet*)resultSet;

-(NSArray*)modelArrayFromDictArray:(NSArray*) array withModelClass:(Class)modelClass;



@end

NS_ASSUME_NONNULL_END
