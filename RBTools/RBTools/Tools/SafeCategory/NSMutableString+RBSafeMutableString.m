//
//  NSMutableString+RBSafeMutableString.m
//  RBTools
//
//  Created by 许瑞邦 on 2017/10/25.
//  Copyright © 2017年 xurb. All rights reserved.
//

#import "NSMutableString+RBSafeMutableString.h"
#import "NSObject+RBMethodSwizzling.h"
#import <objc/message.h>
#define SK_AUTORELEASE(exp) exp

@implementation NSMutableString (RBSafeMutableString)

+ (void) load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSCFConstantString") rb_methodSwizzlingWithOriginalSelector:@selector(appendString:) forSwizzledSelector:@selector(rb_safeAppendString:) ];
        [objc_getClass("__NSCFConstantString") rb_methodSwizzlingWithOriginalSelector:@selector(appendFormat:) forSwizzledSelector:@selector(rb_safeAppendFormat:) ];
        [objc_getClass("__NSCFConstantString") rb_methodSwizzlingWithOriginalSelector:@selector(setString:) forSwizzledSelector:@selector(rb_safeSetString:) ];
        [objc_getClass("__NSCFConstantString") rb_methodSwizzlingWithOriginalSelector:@selector(insertString:atIndex:) forSwizzledSelector:@selector(rb_safeInsertString:atIndex:) ];
    });
}

- (void)rb_safeAppendString:(NSString *)aString {
    if (nil == aString) {
        NSLog(@" carch %s can't append a nil object to NSMutableString", __FUNCTION__);
    }else {
        [self rb_safeAppendString:aString];
    }
}

- (void)rb_safeAppendFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) {
    if (nil == format) {
        NSLog(@" carch %s can't append a nil object to NSMutableString", __FUNCTION__);
    }else {
        va_list arguments;
        va_start(arguments, format);
        NSString *formatStr = [[NSString alloc]initWithFormat:format arguments:arguments];
        formatStr = SK_AUTORELEASE(formatStr);
        [self rb_safeAppendFormat:@"%@",formatStr];
        va_end(arguments);
    }
}

- (void)rb_safeSetString:(NSString *)aString {
    if (nil == aString) {
        NSLog(@" carch %s can't set a nil string to NSMutableString", __FUNCTION__);
    }else {
        [self rb_safeSetString:aString];
    }
}

- (void)rb_safeInsertString:(NSString *)aString atIndex:(NSUInteger)index {
    if (index > [self length]) {
        NSLog(@" carch %s index out of bounds in NSMutableString", __FUNCTION__);
    }else if (nil == aString) {
        NSLog(@" carch %s can't insert a nil string to NSMutableString", __FUNCTION__);
    }else {
        [self rb_safeInsertString:aString atIndex:index];
    }
}

@end
