//
//  UIStoryboard+Extension.m
//  XLinkProject
//
//  Created by Harry Houdini on 2018/2/2.
//  Copyright © 2018年 Houdini Harry. All rights reserved.
//

#import "UIStoryboard+Extension.h"

@implementation UIStoryboard (Extension)
#pragma mark 获取controller
+(__kindof UIViewController*)returnViewControllerInMainStoryBoardWithViewControllerName:(NSString*)viewControllerName {
    return [self returnViewControllerWithStoryBoardName:@"Main" ViewControllerName:viewControllerName];
}

+(__kindof UIViewController*)returnViewControllerWithStoryBoardName:(NSString*)storyBoardName ViewControllerName:(NSString*)viewControllerName {
    UIStoryboard *story = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    UIViewController *viewController = [story instantiateViewControllerWithIdentifier:viewControllerName];
    return viewController;
}
@end
