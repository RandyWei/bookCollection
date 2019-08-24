//
//  BookListCollectionViewCell.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/24.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookListCollectionViewCell : UICollectionViewCell
@property(strong,nonatomic) UIImageView *coverImageView;
@property(strong,nonatomic) UILabel *authorLabel;
@property(strong,nonatomic) UILabel *titleLabel;
@property(strong,nonatomic) UIView *tagsView;
@end

NS_ASSUME_NONNULL_END
