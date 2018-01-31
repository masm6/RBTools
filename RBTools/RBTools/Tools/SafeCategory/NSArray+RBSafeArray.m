//
//  NSArray+RBSafeArray.m
//  RBTools
//
//  Created by 许瑞邦 on 2017/10/25.
//  Copyright © 2017年 xurb. All rights reserved.
//

#import "NSArray+RBSafeArray.h"
#import "NSObject+RBMethodSwizzling.h"
#import <objc/runtime.h>

@implementation NSArray (RBSafeArray)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //        取值
        [objc_getClass("__NSArrayI") rb_methodSwizzlingWithOriginalSelector:@selector(objectAtIndex:) forSwizzledSelector:@selector(rb_safeObjectAtIndexI:)];
        [objc_getClass("__NSArrayI") rb_methodSwizzlingWithOriginalSelector:@selector(arrayByAddingObject:) forSwizzledSelector:@selector(rb_safeArrayByAddingObjectI:)];
        [objc_getClass("__NSArray0") rb_methodSwizzlingWithOriginalSelector:@selector(objectAtIndex:) forSwizzledSelector:@selector(rb_safeObjectAtIndex0:)];
        [objc_getClass("__NSArray0") rb_methodSwizzlingWithOriginalSelector:@selector(arrayByAddingObject:) forSwizzledSelector:@selector(rb_safeArrayByAddingObject0:)];
        
        [objc_getClass("__NSSingleObjectArrayI") rb_methodSwizzlingWithOriginalSelector:@selector(objectAtIndex:) forSwizzledSelector:@selector(rb_safeObjectAtIndexSingle:)];
        [objc_getClass("__NSSingleObjectArrayI") rb_methodSwizzlingWithOriginalSelector:@selector(arrayByAddingObject:) forSwizzledSelector:@selector(rb_safeArrayByAddingObjectSingle:)];
        
        [objc_getClass("__NSPlaceholderArray") rb_methodSwizzlingWithOriginalSelector:@selector(objectAtIndex:) forSwizzledSelector:@selector(rb_safeObjectAtIndexPlaceholder:)];
        [objc_getClass("__NSPlaceholderArray") rb_methodSwizzlingWithOriginalSelector:@selector(arrayByAddingObject:) forSwizzledSelector:@selector(rb_safeArrayByAddingObjectPlaceholder:)];
        //        赋值
        [objc_getClass("__NSPlaceholderArray") rb_methodSwizzlingWithOriginalSelector:@selector(initWithObjects:count:) forSwizzledSelector:@selector(rb_safeInitWithObjects:count:)];
    });
}

#pragma mark objectAtIndex:
//__NSArrayI
- (id)rb_safeObjectAtIndexI:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@" carch %s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }else if (index > self.count) {
        NSLog(@" carch %s index out of bounds in array", __FUNCTION__);
        return nil;
    }else {
        return [self rb_safeObjectAtIndexI:index];
    }
}

- (NSArray *)rb_safeArrayByAddingObjectI:(id)anObject {
    if (nil == anObject) {
        NSLog(@" carch %s can't add a nil  object to array", __FUNCTION__);
        return self;
    }else {
        return [self rb_safeArrayByAddingObjectI:anObject];
    }
}

//__NSArray0
- (id)rb_safeObjectAtIndex0:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@" carch %s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }else if (index > self.count) {
        NSLog(@" carch %s index out of bounds in array", __FUNCTION__);
        return nil;
    }else {
        return [self rb_safeObjectAtIndex0:index];
    }
}

- (NSArray *)rb_safeArrayByAddingObject0:(id)anObject {
    if (nil == anObject) {
        NSLog(@" carch %s can't add a nil  object to array", __FUNCTION__);
        return self;
    }else {
        return [self rb_safeArrayByAddingObject0:anObject];
    }
}

//__NSSingleObjectArrayI
- (id)rb_safeObjectAtIndexSingle:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@" carch %s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }else if (index > self.count) {
        NSLog(@" carch %s index out of bounds in array", __FUNCTION__);
        return nil;
    }else {
        return [self rb_safeObjectAtIndexSingle:index];
    }
}

- (NSArray *)rb_safeArrayByAddingObjectSingle:(id)anObject {
    if (nil == anObject) {
        NSLog(@" carch %s can't add a nil  object to array", __FUNCTION__);
        return self;
    }else {
        return [self rb_safeArrayByAddingObjectSingle:anObject];
    }
}

//__NSPlaceholderArray
- (id)rb_safeObjectAtIndexPlaceholder:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@" carch %s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }else if (index > self.count) {
        NSLog(@" carch %s index out of bounds in array", __FUNCTION__);
        return nil;
    }else {
        return [self rb_safeObjectAtIndexPlaceholder:index];
    }
}

- (NSArray *)rb_safeArrayByAddingObjectPlaceholder:(id)anObject {
    if (nil == anObject) {
        NSLog(@" carch %s can't add a nil  object to array", __FUNCTION__);
        return self;
    }else {
        return [self rb_safeArrayByAddingObjectPlaceholder:anObject];
    }
}

#pragma mark initWithObjects:count:

- (id)rb_safeInitWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt{
    for (int i = 0 ; i<cnt ; i++) {
        if (objects[i] == nil) {
            NSLog(@" carch 数组第%d个参数为空",i);
            return nil;
        }
    }
    return [self rb_safeInitWithObjects:objects count:cnt];
}

@end
