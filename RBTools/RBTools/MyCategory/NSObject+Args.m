//
//  NSObject+Args.m
//  RBTools
//
//  Created by 许瑞邦 on 2018/1/6.
//  Copyright © 2018年 xurb. All rights reserved.
//

#import "NSObject+Args.h"

@implementation NSObject (Args)

- (void)performSelectorOnMainThread:(SEL)selector withObjects:(NSArray *)args waidUntilDone:(BOOL)wait
{
    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
    if (!sig) return;
    NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:selector];
    for (int i = 0; i < args.count; i++) {
        id obj = args[i];
        [invo setArgument:&obj atIndex:i + 2];
    }
    [invo retainArguments];
    [invo performSelectorOnMainThread:@selector(invoke) withObject:nil waitUntilDone:wait];
}

- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thread withObjects:(NSArray *)args waitUntilDone:(BOOL)wait {
    NSMethodSignature *sig = [self methodSignatureForSelector:aSelector];
    if (!sig) return;
    NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:aSelector];
    for (int i = 0; i < args.count; i++) {
        id obj = args[i];
        [invo setArgument:&obj atIndex:i + 2];
    }
    [invo retainArguments];
    [invo performSelector:@selector(invoke) onThread:thread withObject:nil waitUntilDone:wait];
}

@end
