//
//  BookBaseModel.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/11.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookBaseModel.h"

@implementation BookBaseModel

-(instancetype)initWithDictionary:(NSDictionary*)dict{
    NSString* msg = [NSString stringWithFormat:@"%s is not implemented for the class %@",sel_getName(_cmd),self];
    @throw [NSException exceptionWithName:@"BookModelInitialzeException" reason:msg userInfo:nil];
}
-(id)copyWithZone:(NSZone*) zone{
    NSString* msg = [NSString stringWithFormat:@"%s is not implemented for the class %@",sel_getName(_cmd),self];
    @throw [NSException exceptionWithName:@"BookModelInitialzeException" reason:msg userInfo:nil];
}

-(NSArray*)modelArrayFromDictArray:(NSArray*) array withModelClass:(Class)modelClass{
    NSParameterAssert(modelClass!=nil);
    NSParameterAssert([modelClass isSubclassOfClass:BookBaseModel.class]);
    
    NSMutableArray *models = [@[] mutableCopy];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BookBaseModel *model = [[modelClass alloc]initWithDictionary:obj];
        [models addObject:model];
    }];
    return models;
}
@end
