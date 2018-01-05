//
//  UINavigationController+RBStackManager.h
//  RBTools
//
//  Created by 许瑞邦 on 2018/1/6.
//  Copyright © 2018年 xurb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (RBStackManager)
/**
 寻找navigation中的Ctrl
 
 @param className 类名称
 @return ctrl对象
 */
- (id)rb_findViewController:(NSString *)className;

/**
 判断navigation是否只有一个RootViewController
 
 @return 是否是根视图
 */
- (BOOL)rb_isOnlyContainRootViewController;

/**
 根视图
 
 @return 根视图
 */
- (UIViewController *)rb_rootViewController;

/**
 pop到指定视图控制器（找不到就回到根视图控制器）
 
 @param className 类名称
 @param animated 动画
 @return 剩余viewControllers
 */
- (NSArray<UIViewController *> *)rb_popToViewControllerWithClassName:(NSString *)className animated:(BOOL)animated;

/**
 pop到指定层（找不到就回到根视图控制器）
 
 @param level 指定层
 @param animated 动画
 @return 剩余ViewControllers
 */
- (NSArray<UIViewController *> *)rb_popToViewControllerWithLevel:(NSUInteger)level animated:(BOOL)animated;
@end
