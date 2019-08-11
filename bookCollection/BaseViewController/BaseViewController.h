//
//  BaseViewController.h
//  bookCollection
//
//  Created by RandyWei on 2019/8/10.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
-(UIImage*)navigationBarBackgroundImage;

-(BOOL)shouldShowShadowImage;

-(BOOL)shouldHideBottomWhenPushed;
@end

NS_ASSUME_NONNULL_END
