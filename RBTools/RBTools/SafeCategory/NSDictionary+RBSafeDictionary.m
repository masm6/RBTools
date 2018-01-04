//
//  NSDictionary+RBSafeDictionary.m
//  RBTools
//
//  Created by 许瑞邦 on 2017/10/25.
//  Copyright © 2017年 xurb. All rights reserved.
//

#import "NSDictionary+RBSafeDictionary.h"
#import "NSObject+RBMethodSwizzling.h"
#import <objc/message.h>

@implementation NSDictionary (RBSafeDictionary)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSPlaceholderDictionary") rb_methodSwizzlingWithOriginalSelector:@selector(initWithObjects:forKeys:count:) forSwizzledSelector:@selector(rb_safeInitWithObjects:forKeys:count:)];
    });
}
- (instancetype)rb_safeInitWithObjects:(const id _Nonnull [_Nullable])objects forKeys:(const id <NSCopying> _Nonnull [_Nullable])keys count:(NSUInteger)cnt{
    
    if (cnt == 0) {
        return [self rb_safeInitWithObjects:objects forKeys:keys count:0];
    }else if (nil == objects) {
        kLTNSLog(@" carch %s object can't be nil", __FUNCTION__);
        return nil;
    }else if (nil == keys) {
        kLTNSLog(@" carch %s key can't be nil", __FUNCTION__);
        NSLog(@"keys is nil");
        return nil;
    }else {
        // 指向objects初始位置
        // 指向keys初始位置
        NSUInteger keyCnt = 0;
        NSUInteger valueCnt = 0;
        // 遍历找到为key nil的位置
        for (   ; valueCnt < cnt; valueCnt ++, objects++) {
            if (*objects == 0)
            {
                break;
            }
        }
        // 遍历找到为key nil的位置
        for (   ; keyCnt < cnt; keyCnt ++, keys++) {
            if (*keys == 0) // 遍历找到为key nil的位置
            {
                break;
            }
        }
        // 找到最小值
        //cnt 不能越界
        NSUInteger minCnt = MIN(keyCnt, valueCnt);
        NSInteger newCnt = MIN(minCnt, cnt);
        
        for (int i = 0; i<valueCnt; i++) {
            objects--;
        }
        for (int i = 0; i<keyCnt; i++) {
            keys--;
        }
        
        return [self rb_safeInitWithObjects:objects forKeys:keys count:newCnt];
    }
}

@end
