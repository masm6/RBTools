//
//  UITextField+Extension.m
//  Fotile
//
//  Created by AllenKwok on 16/5/3.
//  Copyright © 2016年 xlink.cn. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension) 

/** 清除输入框的首尾空格和换行符*/
- (NSString *)clearSpace{
    self.text = [self.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return self.text;
}

-(void)addBlackShowPasswordButton{
    //密码明文
    UIButton *checkPwdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    checkPwdButton.frame = CGRectMake(0, 0, 35, 35);
    [checkPwdButton addTarget:self action:@selector(checkPwdButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [checkPwdButton setImage:[UIImage imageNamed:@"show_ic"] forState:UIControlStateNormal];
    [checkPwdButton setImage:[UIImage imageNamed:@"hide_ic"] forState:UIControlStateSelected];
    checkPwdButton.selected = self.secureTextEntry;
    self.rightView = checkPwdButton;
    // 当前键盘类型为 英文加数字类型
    self.keyboardType = UIKeyboardTypeAlphabet;
    self.rightViewMode = UITextFieldViewModeAlways;
}

- (void)addGrayShowPasswordButton {
    //密码明文
    UIButton *checkPwdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    checkPwdButton.frame = CGRectMake(0, 0, 35, 35);
    [checkPwdButton addTarget:self action:@selector(checkPwdButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [checkPwdButton setImage:[UIImage imageNamed:@"wifi_show_ic-"] forState:UIControlStateNormal];
    [checkPwdButton setImage:[UIImage imageNamed:@"wifi_hide_ic"] forState:UIControlStateSelected];
    checkPwdButton.selected = self.secureTextEntry;
    // 当前键盘类型为 英文加数字类型
    self.keyboardType = UIKeyboardTypeAlphabet;
    self.rightView = checkPwdButton;
    self.rightViewMode = UITextFieldViewModeAlways;
}

- (void)checkPwdButtonClick:(UIButton *)button{
    button.selected = !button.selected;
    self.secureTextEntry = button.selected;
    if (self.isFirstResponder) {
        [self resignFirstResponder];
        [self becomeFirstResponder];
    }
}

- (void)setPlaceholderColor:(UIColor *)color{
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

@end
