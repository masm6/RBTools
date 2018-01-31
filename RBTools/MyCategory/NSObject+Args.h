//
//  NSObject+Args.h
//  RBTools
//
//  Created by 许瑞邦 on 2018/1/6.
//  Copyright © 2018年 xurb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Args)
/**
 *  调用主线程 传多个参数
 *
 *  @param selector 方法名称
 *  @param args     参数集合
 *  @param wait     是否等待
 */
- (void)performSelectorOnMainThread:(SEL)selector withObjects:(NSArray *)args waidUntilDone:(BOOL)wait;

/**
 在某个线程执行传入多个参数
 
 @param aSelector 方法名称
 @param thread    线程名称
 @param args      参数集合
 @param wait      是否等待
 */
- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thread withObjects:(NSArray *)args waitUntilDone:(BOOL)wait;

@end
