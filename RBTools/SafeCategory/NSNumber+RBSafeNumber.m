//
//  NSNumber+RBSafeNumber.m
//  RBTools
//
//  Created by 许瑞邦 on 2017/10/25.
//  Copyright © 2017年 xurb. All rights reserved.
//

#import "NSNumber+RBSafeNumber.h"
#import "NSObject+RBMethodSwizzling.h"
#import <objc/runtime.h>

@implementation NSNumber (RBSafeNumber)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSCFNumber") rb_methodSwizzlingWithOriginalSelector:@selector(isEqualToNumber:) forSwizzledSelector:@selector(rb_safeIsEqualToNumber:) ];
        [objc_getClass("__NSCFNumber") rb_methodSwizzlingWithOriginalSelector:@selector(compare:) forSwizzledSelector:@selector(rb_safeCompare:)];
    });
}

- (BOOL)rb_safeIsEqualToNumber:(NSNumber *)number {
    if (nil == number) {
        NSLog(@" carch %s can't isEqual to nil number ", __FUNCTION__);
        return NO;
    }else {
        return [self rb_safeIsEqualToNumber:number];
    }
}

- (NSComparisonResult)rb_safeCompare:(NSNumber *)number {
    if (nil == number) {
        NSLog(@" carch %s can't compare to nil number ", __FUNCTION__);
        return NSOrderedAscending;
    }else {
        return [self rb_safeCompare:number];
    }
}

@end
