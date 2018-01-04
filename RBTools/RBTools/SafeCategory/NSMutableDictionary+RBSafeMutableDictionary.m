//
//  NSMutableDictionary+RBSafeMutableDictionary.m
//  RBTools
//
//  Created by 许瑞邦 on 2017/10/25.
//  Copyright © 2017年 xurb. All rights reserved.
//

#import "NSMutableDictionary+RBSafeMutableDictionary.h"
#import "NSObject+RBMethodSwizzling.h"
#import <objc/message.h>

@implementation NSMutableDictionary (RBSafeMutableDictionary)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSDictionaryM") rb_methodSwizzlingWithOriginalSelector:@selector(setObject:forKey:) forSwizzledSelector:@selector(rb_safeSetObject:forKey:) ];
        [objc_getClass("__NSDictionaryM") rb_methodSwizzlingWithOriginalSelector:@selector(setValue:forKey:) forSwizzledSelector:@selector(rb_safeSetValue:forKey:)];
        [objc_getClass("__NSDictionaryM") rb_methodSwizzlingWithOriginalSelector:@selector(removeObjectForKey:) forSwizzledSelector:@selector(rb_safeRemoveObjectForKey:)];
    });
}

-(void)rb_safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if (anObject == nil) {
        kLTNSLog(@" carch %s can add nil object into NSMutableDictionary", __FUNCTION__);
    } else {
        [self rb_safeSetObject:anObject forKey:aKey];
    }
}

-(void)rb_safeSetValue:(id)value forKey:(NSString *)key{
    if (value == nil) {
        kLTNSLog(@" carch %s can add nil object into NSMutableDictionary", __FUNCTION__);
    } else {
        [self rb_safeSetValue:value forKey:key];
    }
}

- (void)rb_safeRemoveObjectForKey:(id)aKey {
    if (nil == aKey) {
        kLTNSLog(@" carch %s can remove  object for nil key", __FUNCTION__);
    }else {
        [self rb_safeRemoveObjectForKey:aKey];
        
    }
}

@end
