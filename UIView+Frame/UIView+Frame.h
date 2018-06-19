//
//  UIView+Frame.h
// Space
//
//  Created by apple on 15-3-5.
//  Copyright (c) 2015年 Space. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
// 分类不能添加成员属性
// @property如果在分类里面，只会自动生成get,set方法的声明，不会生成成员属性，和方法的实现
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;


@end
