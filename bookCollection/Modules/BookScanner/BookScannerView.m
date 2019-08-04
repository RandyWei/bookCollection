//
//  BookScannerView.m
//  bookCollection
//
//  Created by RandyWei on 2019/8/4.
//  Copyright © 2019 RandyWei. All rights reserved.
//

#import "BookScannerView.h"

@interface BookScannerView()
@property(assign,nonatomic)CGSize rectSize;
@property(assign,nonatomic)CGFloat offsetY;
@property(strong,nonatomic)UIImageView *animationLine;
@property(assign,nonatomic,getter=isAnimationReverse)BOOL animationReverse;
@property(assign,nonatomic,getter=isAnimating)BOOL animating;
@end

@implementation BookScannerView


-(id)initWithFrame:(CGRect)frame rectSize:(CGSize)rectSize offsetY:(CGFloat)offsetY{
    self = [super initWithFrame:frame];
    if (self) {
        self.rectSize = rectSize;
        self.offsetY= offsetY;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //计算基准坐标
    CGFloat minX = (self.frame.size.width - self.rectSize.width) /2 ;
    CGFloat maxX = minX + self.rectSize.width;
    CGFloat minY = (self.frame.size.height - self.rectSize.height) /2;
    CGFloat maxY = self.rectSize.height + minY;
    
    //绘制半透明区域
    
    CGContextSetRGBFillColor(context, 0,0,0,0.4f);
    
    CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width, minY));
    CGContextFillRect(context, CGRectMake(0, minY, minX, self.rectSize.height));
    CGContextFillRect(context, CGRectMake(0, maxY, self.frame.size.width, self.frame.size.height-maxY));
    CGContextFillRect(context, CGRectMake(maxX, minY, minX, self.rectSize.height));
    
    //绘制中间区域的白色边框
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 0.5f);
    CGContextAddRect(context, CGRectMake(minX, minY, self.rectSize.width, self.rectSize.height));
    CGContextStrokePath(context);
    
}


-(UIImageView*)animationLine{
    if(_animationLine==nil){
        CGFloat minX = (self.frame.size.width - self.rectSize.width) /2 ;
        CGFloat minY = (self.frame.size.height - self.rectSize.height) /2;
        _animationLine = [[UIImageView alloc]initWithFrame:CGRectMake(minX, minY, self.rectSize.width, 1.0f)];
        [_animationLine setImage:[UIImage imageNamed:@"scanner-line"]];
        [self addSubview:_animationLine];
    }
    return _animationLine;
}

-(void)startAnimation{
    if (self.animating) {
        return;
    }
    self.animating = YES;
    CGFloat minX = (self.frame.size.width - self.rectSize.width) /2 ;
    CGFloat minY = (self.frame.size.height - self.rectSize.height) /2;
    CGFloat maxY = self.rectSize.height + minY;
    
    [UIView animateWithDuration:2.0f delay:0.5f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (self.animationReverse) {
            self.animationLine.frame = CGRectMake(minX, maxY, self.rectSize.width, 1.0f);
        }else{
            self.animationLine.frame = CGRectMake(minX, minY, self.rectSize.width, 1.0f);
        }
    } completion:^(BOOL finished) {
        if (finished) {
            self.animationReverse = !self.animationReverse;
            self.animating = NO;
            [self startAnimation];
        }else{
            [self stopAnimation];
        }
    }];
}
-(void)stopAnimation{
    [self.animationLine removeFromSuperview];
    self.animationLine = nil;
    self.animating = NO;
    self.animationReverse = NO;
}

@end
