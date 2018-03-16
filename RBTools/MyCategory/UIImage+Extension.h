//
//  UIImage+Extension.h
//  Fotile
//
//  Created by AllenKwok on 16/5/18.
//  Copyright © 2016年 xlink.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  @brief  根据颜色生成纯色图片
 *
 *  @param color 颜色
 *
 *  @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 * 圆形图片
 */
- (UIImage *)circleImage;

/**
 *  压缩特定尺寸的UImage
 *
 *  @param size  要设定的图片大小
 *
 *  @return 压缩后的图片
 */
-(UIImage*)resizeImageToSize:(CGSize)size;

@end
