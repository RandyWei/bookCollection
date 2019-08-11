//
//  BookDetailViewController.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/11.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BaseViewController.h"
#import "BookEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookDetailViewController : BaseViewController<UIScrollViewDelegate>
@property(copy,nonatomic)BookEntity* bookEntity;
@end

NS_ASSUME_NONNULL_END
