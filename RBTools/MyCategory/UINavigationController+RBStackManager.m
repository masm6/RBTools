//
//  UINavigationController+RBStackManager.m
//  RBTools
//
//  Created by 许瑞邦 on 2018/1/6.
//  Copyright © 2018年 xurb. All rights reserved.
//

#import "UINavigationController+RBStackManager.h"

@implementation UINavigationController (RBStackManager)

- (id)rb_findViewController:(NSString *)className {
    for (UIViewController *ctrl in self.viewControllers) {
        if ([ctrl isKindOfClass:NSClassFromString(className)]) {
            return ctrl;
        }
    }
    return nil;
}

- (BOOL)rb_isOnlyContainRootViewController {
    if (self.viewControllers && 1 == self.viewControllers.count) {
        return YES;
    }
    return NO;
}

- (UIViewController *)rb_rootViewController {
    if (self.viewControllers && [self.viewControllers count] > 0) {
        return [self.viewControllers firstObject];
    }
    return nil;
}

- (NSArray *)rb_popToViewControllerWithClassName:(NSString *)className animated:(BOOL)animated {
    return [self popToViewController:[self rb_findViewController:className] animated:animated];
}

- (NSArray *)rb_popToViewControllerWithLevel:(NSUInteger)level animated:(BOOL)animated {
    NSInteger ctrls = self.viewControllers.count;
    if (ctrls > level) {
        NSUInteger idx = ctrls - level - 1;
        UIViewController *ctrl = self.viewControllers[idx];
        return [self popToViewController:ctrl animated:YES];
    }else {
        return [self popToRootViewControllerAnimated:animated];
    }
    
}

@end
