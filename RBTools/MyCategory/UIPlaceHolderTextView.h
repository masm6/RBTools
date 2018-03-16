//
//  UIPlaceHolderTextView.h
//  YYApplicationSample
//
//  Created by YYC on 15/6/24.
//  Copyright (c) 2015年 SiuJiYung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView
@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;
@end
