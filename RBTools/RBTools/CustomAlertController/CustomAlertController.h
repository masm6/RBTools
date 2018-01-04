//
//  CustomAlertController.h
//  RBTools
//
//  Created by 许瑞邦 on 2017/10/26.
//  Copyright © 2017年 xurb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAlertAction : UIAlertAction

/**
 按钮字体颜色
 */
@property (nonatomic,strong) UIColor *titleColor;

/**
 按钮字体尺寸
 */
@property (nonatomic, strong) UIFont *titleFont;


/**
 背景颜色
 
 */
@property (nonatomic, strong) UIColor *backgroudColor;


@end

@interface CustomAlertController : UIAlertController
/**
 alertController标题颜色
 */
@property (nonatomic, strong) UIColor *titleColor;

/**
 标题字体尺寸
 */
@property (nonatomic, strong) UIFont *titleFont;

/**
 alertController详细信息
 */
@property (nonatomic, strong) UIColor *messageColor;

/**
 详细信息尺寸
 */
@property (nonatomic, strong) UIFont *messageFont;

@end
