//
//  BookListTableViewCell.h
//  bookCollection
//
//  Created by Wei on 2019/8/19.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookListTableViewCell : BookBaseTableViewCell
@property(strong,nonatomic) UIImageView *coverImageView;
@property(strong,nonatomic) UILabel *authorLabel;
@property(strong,nonatomic) UILabel *titleLabel;
@property(strong,nonatomic) UIView *tagsView;
@end

NS_ASSUME_NONNULL_END
