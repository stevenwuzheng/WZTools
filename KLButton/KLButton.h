//
//  KLButton.h
//  BGOA
//
//  Created by 卢剑峰 on 2017/11/9.
//  Copyright © 2017年 kenloo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ButtonBlock)(UIButton *button);

typedef NS_ENUM(NSInteger, KLImagePosition) {
    KLImagePositionNone = 0,
    KLImagePositionLeft,              //图片在左，文字在右，默认
    KLImagePositionRight,             //图片在右，文字在左
    KLImagePositionTop,               //图片在上，文字在下
    KLImagePositionBottom,            //图片在下，文字在上
};

@interface KLButton : UIButton

@property(nonatomic,copy)ButtonBlock block;

- (void)addTapBlock:(ButtonBlock)block;

- (void)setImagePosition:(KLImagePosition)postion spacing:(CGFloat)spacing;

- (void)setMargin:(CGFloat)margin; // 设置靠左还是靠右的距离

@end
