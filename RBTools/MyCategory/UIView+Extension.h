//
//  UIView+Extension.h
//  XLinkProject
//
//  Created by Houdini Harry on 2018/1/25.
//  Copyright © 2018年 Houdini Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat MaxX;
@property (nonatomic, assign) CGFloat MaxY;

/** 水平居中 */
- (void)alignHorizontal;
/** 垂直居中 */
- (void)alignVertical;
//各方位的切圆角
-(void)addCorner:(UIRectCorner)corner size:(CGSize)size;

#pragma mark - 截屏
-(UIImage*)screenShot;
-(UIImage*)screenShotWithBounds:(CGRect)bounds;

#pragma mark - 取view上一点的颜色
- (UIColor*)colorAtPixel:(CGPoint)point;


@end
