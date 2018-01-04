//
//  NSObject+RBMethodSwizzling.m
//  RBTools
//
//  Created by 许瑞邦 on 2017/10/24.
//  Copyright © 2017年 xurb. All rights reserved.
//

#import "NSObject+RBMethodSwizzling.h"
#import <objc/runtime.h>

@implementation NSObject (RBMethodSwizzling)

+ (void)rb_methodSwizzlingWithOriginalSelector:(SEL)originalSelector forSwizzledSelector:(SEL)swizzledSelector {
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    //先尝试給源SEL添加IMP，这里是为了避免源SEL没有实现IMP的情况
    BOOL didAddMethod = class_addMethod(class,originalSelector,method_getImplementation(swizzledMethod),method_getTypeEncoding(swizzledMethod));
    //添加成功：说明源SEL没有实现IMP，将源SEL的IMP替换到交换SEL的IMP
    if (didAddMethod) {
        class_replaceMethod(class,swizzledSelector,method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        //添加失败：说明源SEL已经有IMP，直接将两个SEL的IMP交换即可
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


@end
