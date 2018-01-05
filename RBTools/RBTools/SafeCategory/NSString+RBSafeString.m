//
//  NSString+RBSafeString.m
//  RBTools
//
//  Created by 许瑞邦 on 2017/10/25.
//  Copyright © 2017年 xurb. All rights reserved.
//

#import "NSString+RBSafeString.h"
#import "NSObject+RBMethodSwizzling.h"
#import <objc/message.h>

@implementation NSString (RBSafeString)

+ (void) load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSCFString") rb_methodSwizzlingWithOriginalSelector:@selector(characterAtIndex:) forSwizzledSelector:@selector(rb_safeCharacterAtIndex:) ];
        [objc_getClass("__NSCFString") rb_methodSwizzlingWithOriginalSelector:@selector(substringWithRange:) forSwizzledSelector:@selector(rb_safeSubstringWithRange:)];
    });
}

- (unichar)rb_safeCharacterAtIndex:(NSUInteger)index {
    if (index >= [self length]) {
        NSLog(@" carch %s index out of bounds in string", __FUNCTION__);
        return 0;
    }else {
        return [self rb_safeCharacterAtIndex:index];
    }
}

- (NSString *)rb_safeSubstringWithRange:(NSRange)range {
    if (range.location + range.length > self.length) {
        NSLog(@" carch %s range out of bounds in string", __FUNCTION__);
        return @"";
    }else {
        return [self rb_safeSubstringWithRange:range];
    }
}

@end
