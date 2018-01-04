//
//  CustomAlertController.m
//  RBTools
//
//  Created by 许瑞邦 on 2017/10/26.
//  Copyright © 2017年 xurb. All rights reserved.
//

#import "CustomAlertController.h"
#import <objc/runtime.h>

@interface CustomAlertController ()

@end

@implementation CustomAlertAction

- (void)setTitleColor:(UIColor *)titleColor {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UIAlertAction class], &count);
    for(int i = 0;i < count;i ++){
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
        if ([ivarName isEqualToString:@"_titleTextColor"]) {
            [self setValue:titleColor forKey:@"titleTextColor"];
        }
    }
}
- (void)setTitleFont:(UIFont *)titleFont {
    
}
@end

@implementation CustomAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UIAlertController class], &count);
    for(int i = 0;i < count;i ++){
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
        //标题颜色
        if ([ivarName isEqualToString:@"_attributedTitle"] && self.title && self.titleColor) {
            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:self.title attributes:@{NSForegroundColorAttributeName:self.titleColor,NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0]}];
            [self setValue:attr forKey:@"attributedTitle"];
        }
        //描述颜色
        if ([ivarName isEqualToString:@"_attributedMessage"] && self.message && self.messageColor) {
            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.message attributes:@{NSForegroundColorAttributeName:self.messageColor,NSFontAttributeName:[UIFont systemFontOfSize:14.0]}];
            [self setValue:attr forKey:@"attributedMessage"];
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
