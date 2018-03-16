//
//  UITextField+Extension.h
//  Fotile
//
//  Created by AllenKwok on 16/5/3.
//  Copyright © 2016年 xlink.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)

/** 清除输入框的首尾空格和换行符*/
- (NSString *)clearSpace;

/**
 *  添加白色的显示隐藏密码按钮
 */
- (void)addBlackShowPasswordButton;

/**
 *  添加灰色的显示隐藏密码按钮
 */
-(void)addGrayShowPasswordButton;

/**
 设置 placeholder 颜色
 */
- (void)setPlaceholderColor:(UIColor *)color;

@end
