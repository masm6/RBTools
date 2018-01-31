//
//  UIButton+RBCountTime.m
//  RBTools
//
//  Created by 许瑞邦 on 2018/1/6.
//  Copyright © 2018年 xurb. All rights reserved.
//

#import "UIButton+RBCountTime.h"

@implementation UIButton (RBCountTime)
-(void)rb_startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle {
    __block NSInteger blockTimeout = timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(blockTimeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:tittle forState:UIControlStateNormal];
                NSString *strTime = [NSString stringWithFormat:@"%.2ld", (long)timeout];
                [self setTitle:[NSString stringWithFormat:@"%@%@", strTime, waitTittle] forState:UIControlStateDisabled];
                self.enabled = YES;
                self.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            //            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2ld", (long)blockTimeout];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [self setTitle:[NSString stringWithFormat:@"%@%@",strTime, waitTittle] forState:UIControlStateDisabled];
                [UIView commitAnimations];
                self.userInteractionEnabled = NO;
                self.enabled = NO;
            });
            blockTimeout--;
        }
    });
    dispatch_resume(_timer);
}

@end
