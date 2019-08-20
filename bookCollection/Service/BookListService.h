//
//  BookListService.h
//  bookCollection
//
//  Created by Wei on 2019/8/19.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookListService : NSObject

+(NSArray<BookEntity*>*) getAllBookEntities;

@end

NS_ASSUME_NONNULL_END
