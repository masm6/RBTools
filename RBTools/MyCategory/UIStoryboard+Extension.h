//
//  UIStoryboard+Extension.h
//  XLinkProject
//
//  Created by Harry Houdini on 2018/2/2.
//  Copyright © 2018年 Houdini Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (Extension)
#pragma mark 获取Controller
/**
 *  获取MainStoryboard上的Controller
 *
 *  @param viewControllerName Storyboard的ControllerId
 *
 *  @return 通过返回UIViewController
 */
+(__kindof UIViewController*)returnViewControllerInMainStoryBoardWithViewControllerName:(NSString*)viewControllerName;
/**
 *  获取制定名字上的Controller
 *
 *  @param storyBoardName Storyboard的name
 *
 *  @param viewControllerName Storyboard的ControllerId
 *
 *  @return 通过返回UIViewController
 */
+(__kindof UIViewController*)returnViewControllerWithStoryBoardName:(NSString*)storyBoardName ViewControllerName:(NSString*)viewControllerName;
@end
