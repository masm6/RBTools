//
//  NSObject+RBMethodSwizzling.h
//  RBTools
//
//  Created by 许瑞邦 on 2017/10/24.
//  Copyright © 2017年 xurb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RBMethodSwizzling)

+ (void)rb_methodSwizzlingWithOriginalSelector:(SEL)originalSelector forSwizzledSelector:(SEL)swizzledSelector;

@end
