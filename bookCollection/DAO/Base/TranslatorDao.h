//
//  TranslatorDao.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BaseDao.h"
#import "BookTranslator.h"

NS_ASSUME_NONNULL_BEGIN

@interface TranslatorDao : BaseDao
+(long long)insertModel:(BookTranslator*)model withDataBase:(FMDatabase*)db;
+(NSArray<BookTranslator*>*)queryModelsWithBookId:(long long)bookId withDataBase:(FMDatabase*)db;
@end

NS_ASSUME_NONNULL_END
