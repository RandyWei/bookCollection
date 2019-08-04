//
//  BookScannerView.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/4.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookScannerView : UIView
-(id)initWithFrame:(CGRect)frame rectSize:(CGSize)rectSize offsetY:(CGFloat)offsetY;
-(void)startAnimation;
-(void)stopAnimation;
@end

NS_ASSUME_NONNULL_END
