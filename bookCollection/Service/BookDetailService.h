//
//  BookDetailService.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookEntity.h"


NS_ASSUME_NONNULL_BEGIN

@interface BookDetailService : NSObject

+(long long)favBook:(BookEntity*)entity;

+(BookEntity*)searchBookEntityByDoubanId:(long long)doubanId;

@end

NS_ASSUME_NONNULL_END
