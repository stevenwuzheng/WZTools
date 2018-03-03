//
//  KLButton.m
//  BGOA
//
//  Created by 卢剑峰 on 2017/11/9.
//  Copyright © 2017年 kenloo. All rights reserved.
//

#import "KLButton.h"
//#import "NSString+Category.h"

@interface KLButton()

@property (nonatomic, assign) KLImagePosition position;
@property (nonatomic, assign) CGFloat spacing;
@property (nonatomic, assign) CGFloat margin;

@end

@implementation KLButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.position != KLImagePositionNone) {
        [self setupImagePosition];
    }
}

- (void)setupImagePosition {
    
    CGFloat spacing = self.spacing;
    
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    
    //CGFloat labelWidth = [self.titleLabel.text estimateSizeWithFont:self.titleLabel.font].width;
    //CGFloat labelHeight = [self.titleLabel.text estimateSizeWithFont:self.titleLabel.font].height;
    CGFloat labelWidth = [self estimateStringSize:self.titleLabel.text withFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self estimateStringSize:self.titleLabel.text withFont:self.titleLabel.font].height;
    
    CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    CGFloat totolHeight = imageHeight + labelHeight + self.spacing;
    CGFloat margin = (CGRectGetHeight(self.frame) - totolHeight) / 2;
    
    switch (self.position) {
        case KLImagePositionLeft:
            switch (self.contentHorizontalAlignment) {
                case UIControlContentHorizontalAlignmentLeft:
                {
                    self.imageEdgeInsets = UIEdgeInsetsMake(0, self.margin, 0, -self.margin);
                    self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing+self.margin, 0, -spacing-self.margin);
                }
                    break;
                case UIControlContentHorizontalAlignmentRight:
                {
                    self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing-self.margin, 0, spacing+self.margin);
                    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.margin, 0, self.margin);
                }
                    break;
                default:
                {
                    self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
                    self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
                }
                    break;
            }
            break;
            
        case KLImagePositionRight:
            
            switch (self.contentHorizontalAlignment) {
                case UIControlContentHorizontalAlignmentLeft:
                {
                    self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing + self.margin, 0, -(labelWidth + spacing + self.margin));
                    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWith + self.margin, 0, imageWith - self.margin);
                }
                    break;
                case UIControlContentHorizontalAlignmentRight:
                {
                    self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth - self.margin, 0, -labelWidth + self.margin);
                    self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWith + spacing + self.margin), 0, imageWith + spacing + self.margin);
                }
                    break;
                default:
                    self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
                    self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWith + spacing/2), 0, imageWith + spacing/2);
                    break;
            }
            break;
            
        case KLImagePositionTop:
        {
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY + margin, imageOffsetX, imageOffsetY - margin, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY + margin, -labelOffsetX, -labelOffsetY - margin, labelOffsetX);
        }
            break;
            
        case KLImagePositionBottom:
        {
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY - margin, imageOffsetX, -imageOffsetY + margin, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY - margin, -labelOffsetX, labelOffsetY + margin, labelOffsetX);
        }
            break;
            
        default:
            break;
    }
    
}

- (void)setMargin:(CGFloat)margin {
    _margin = margin;
}

- (void)setImagePosition:(KLImagePosition)postion spacing:(CGFloat)spacing; {
    self.position = postion;
    self.spacing = spacing;
}

- (void)addTapBlock:(ButtonBlock)block
{
    _block = block;
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonAction:(UIButton *)button
{
    if (_block) {
        _block(button);
    }
}

- (CGSize)estimateStringSize:(NSString *)str withFont:(UIFont*)font {
    if (font == nil) return CGSizeZero;
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
    return [str length] ? [str sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
    return [str length] ? [str sizeWithFont:font] : CGSizeZero;
#endif
}


@end

