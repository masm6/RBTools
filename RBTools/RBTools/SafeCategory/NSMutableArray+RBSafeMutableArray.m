//
//  NSMutableArray+RBSafeMutableArray.m
//  RBTools
//
//  Created by 许瑞邦 on 2017/10/25.
//  Copyright © 2017年 xurb. All rights reserved.
//

#import "NSMutableArray+RBSafeMutableArray.h"
#import "NSObject+RBMethodSwizzling.h"
#import <objc/runtime.h>

@implementation NSMutableArray (RBSafeMutableArray)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSArrayM") rb_methodSwizzlingWithOriginalSelector:@selector(addObject:) forSwizzledSelector:@selector(rb_safeAddObject:)];
        [objc_getClass("__NSArrayM") rb_methodSwizzlingWithOriginalSelector:@selector(removeObject:) forSwizzledSelector:@selector(rb_safeRemoveObject:) ];
        [objc_getClass("__NSArrayM") rb_methodSwizzlingWithOriginalSelector:@selector(insertObject:atIndex:) forSwizzledSelector:@selector(rb_safeInsertObject:atIndex:)];
        [objc_getClass("__NSArrayM") rb_methodSwizzlingWithOriginalSelector:@selector(objectAtIndex:) forSwizzledSelector:@selector(rb_safeObjectAtIndex:)];
        [objc_getClass("__NSArrayM") rb_methodSwizzlingWithOriginalSelector:@selector(removeObjectAtIndex:) forSwizzledSelector:@selector(rb_safeRemoveObjectAtIndex:)];
        [objc_getClass("__NSArrayM") rb_methodSwizzlingWithOriginalSelector:@selector(replaceObjectAtIndex:withObject:) forSwizzledSelector:@selector(rb_safeReplaceObjectAtIndex:withObject:)];
        [objc_getClass("__NSArrayM") rb_methodSwizzlingWithOriginalSelector:@selector(setObject:atIndex:) forSwizzledSelector:@selector(rb_safeSetObject:atIndex:)];
        [objc_getClass("__NSArrayM") rb_methodSwizzlingWithOriginalSelector:@selector(setObject:atIndexedSubscript:) forSwizzledSelector:@selector(rb_safeSetObject:atIndexedSubscript:)];
        [objc_getClass("__NSArrayM") rb_methodSwizzlingWithOriginalSelector:@selector(removeObjectsInRange:) forSwizzledSelector:@selector(rb_safeRemoveObjectsInRange:)];
        
    });
}


- (void)rb_safeAddObject:(id)obj {
    if (obj == nil) {
        NSLog(@" carch %s can add nil object into NSMutableArray", __FUNCTION__);
    } else {
        [self rb_safeAddObject:obj];
    }
}
- (void)rb_safeRemoveObject:(id)obj {
    if (obj == nil) {
        NSLog(@" carch %s call -removeObject:, but argument obj is nil", __FUNCTION__);
    }else {
        [self rb_safeRemoveObject:obj];
    }
}

- (void)rb_safeInsertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) {
        NSLog(@" carch %s can't insert nil into NSMutableArray", __FUNCTION__);
    } else if (index > self.count) {
        NSLog(@" carch %s index out of bounds in NSMutableArray", __FUNCTION__);
    } else {
        [self rb_safeInsertObject:anObject atIndex:index];
    }
}

- (id)rb_safeObjectAtIndex:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@" carch %s can't get any object from an empty NSMutableArray", __FUNCTION__);
        return nil;
    }else if (index > self.count) {
        NSLog(@" carch %s index out of bounds in NSMutableArray", __FUNCTION__);
        return nil;
    }else {
        return [self rb_safeObjectAtIndex:index];
    }
}

- (void)rb_safeRemoveObjectAtIndex:(NSUInteger)index {
    if (self.count <= 0) {
        NSLog(@" carch %s can't get any object from an empty NSMutableArray", __FUNCTION__);
        return;
    }else if (index >= self.count) {
        NSLog(@" carch %s index out of bounds in NSMutableArray", __FUNCTION__);
        return;
    }else {
        [self rb_safeRemoveObjectAtIndex:index];
    }
}

- (void)rb_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (index >= [self count]) {
        NSLog(@" carch %s index out of bounds in NSMutableArray", __FUNCTION__);
        return;
    }else if (!anObject) {
        NSLog(@" carch %s can't get any object from an empty NSMutableArray", __FUNCTION__);
        return;
    }else {
        [self rb_safeReplaceObjectAtIndex:index withObject:anObject];
    }
}

- (void)rb_safeSetObject:(id)anObject atIndex:(NSUInteger)index{
    if (nil == anObject) {
        NSLog(@" carch %s object can't be nil", __FUNCTION__);
        NSLog(@"不能为空");
        return;
    }else if (index>self.count) {
        //可以在最末位增加
        NSLog(@" carch %s index out of bounds in NSMutableArray", __FUNCTION__);
        return;
    }else {
        [self rb_safeSetObject:anObject atIndex:index];
        
    }
}

-(void)rb_safeSetObject:(id)anObject atIndexedSubscript:(NSUInteger)index{
    if (nil == anObject) {
        NSLog(@" carch %s object can't be nil", __FUNCTION__);
        return;
    }else if (index > self.count) {
        NSLog(@" carch %s index out of bounds in NSMutableArray", __FUNCTION__);
        //可以在最末位增加
        return;
    }else {
        [self rb_safeSetObject:anObject atIndexedSubscript:index];
    }
}

- (void)rb_safeRemoveObjectsInRange:(NSRange)range{
    if (range.location > self.count) {
        NSLog(@" carch %s index out of bounds in NSMutableArray", __FUNCTION__);
        return;
    }else if ((range.location + range.length) > self.count) {
        NSLog(@" carch %s index out of bounds in NSMutableArray", __FUNCTION__);
        return;
    }else {
        [self rb_safeRemoveObjectsInRange:range];
    }
}
@end
