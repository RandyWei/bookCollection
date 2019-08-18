//
//  BookDBHelper.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/18.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookDBHelper : NSObject

+ (NSString*) dbFolder;
+ (NSString*) dbPath;
+ (void)buildDataBase;

@end

NS_ASSUME_NONNULL_END
