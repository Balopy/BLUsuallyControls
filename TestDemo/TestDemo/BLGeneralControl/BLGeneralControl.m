//
//  BLGeneralControl.m
//  268EDU_Demo
//
//  Created by Balopy on 2017/7/31.
//  Copyright © 2017年 edu268. All rights reserved.
//

#import "BLGeneralControl.h"

@implementation BLGeneralControl

+ (UILabel *) createUILabelWithTextColor:(UIColor *)color Font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment fromView:(id)view  {
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = color;
    label.textAlignment = textAlignment;
    if (font) {
        label.font = font;
    }
    [view addSubview:label];
    
    return label;
}




+ (UIView *) createUIViewWithBackColor:(UIColor *)color fromVeiew:(id)view {
    
    UIView *lineView= [[UIView alloc] init];
   
    lineView.backgroundColor = color ? color:[UIColor clearColor];
    if (view) {
        [view addSubview:lineView];
    }
    return lineView;
}

+ (UIButton *) createUIButtonWithNormalIcon:(NSString *)normalIcon selectedIcon:(NSString *)selectedIcon {
    return [self createUIButtonWithBackColor:nil title:nil titleColor:nil titleFont:0 normalIcon:normalIcon selectedIcon:selectedIcon fromVeiew:nil];
}


+ (UIButton *) createUIButtonBackgroundWithNormalIcon:(NSString *)normalIcon selectedIcon:(NSString *)selectedIcon fromVeiew:(id)view{
    
    UIButton *unlockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    unlockBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [unlockBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    if (normalIcon && normalIcon.length) {
        [unlockBtn setBackgroundImage:[UIImage imageNamed:normalIcon] forState:UIControlStateNormal];
    }
    
    if (selectedIcon && selectedIcon.length) {
        [unlockBtn setBackgroundImage:[UIImage imageNamed:selectedIcon] forState:UIControlStateSelected];
    }
    
    [view addSubview:unlockBtn];
    
    return unlockBtn;
}
+ (UIButton *) createUIButtonImageWithNormalIcon:(NSString *)normalIcon selectedIcon:(NSString *)selectedIcon fromVeiew:(id)view{
    
    UIButton *unlockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  
    unlockBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [unlockBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    if (normalIcon  && normalIcon.length) {
        [unlockBtn setImage:[UIImage imageNamed:normalIcon] forState:UIControlStateNormal];
    }
    if (selectedIcon && selectedIcon.length) {
        [unlockBtn setImage:[UIImage imageNamed:selectedIcon] forState:UIControlStateSelected];
    }
    [view addSubview:unlockBtn];
    return unlockBtn;
    
    
}

+ (UIButton *) createUIButtonWithBackColor:(UIColor *)color title:(NSString *)normalTitle titleColor:(UIColor *)textColor titleFont:(UIFont *)font normalIcon:(NSString *)normalIcon selectedIcon:(NSString *)selectedIcon fromVeiew:(id)view {
    
    UIButton *unlockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [unlockBtn setBackgroundColor:color];
    
    [unlockBtn setTitle:normalTitle forState:UIControlStateNormal];
    
    [unlockBtn setTitleColor:textColor forState:UIControlStateNormal];
    
    unlockBtn.titleLabel.font = font;
    
    if (normalIcon && normalIcon.length) {
        [unlockBtn setBackgroundImage:[UIImage imageNamed:normalIcon] forState:UIControlStateNormal];
    }
    if (selectedIcon && selectedIcon.length) {
        [unlockBtn setBackgroundImage:[UIImage imageNamed:selectedIcon] forState:UIControlStateSelected];
    }
    
    [view addSubview:unlockBtn];
    return unlockBtn;
    
}

+ (UIImageView *) createUIImageViewWithName:(NSString *)name toView:(id)view {
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    if (name && name.length) {
        imageView.image = [UIImage imageNamed:name];
    }
    [view addSubview:imageView];
    return imageView;
}


+ (UITextField *)createUITextFieldWithColor:(UIColor *)color font:(CGFloat)font placeholder:(NSString *)placeholder textAlignment:(NSTextAlignment)textAlignment toView:(id)view {
    
    UITextField*textField= [[UITextField alloc]init];
    textField.backgroundColor = color;
    textField.placeholder = placeholder;
    textField.textAlignment = textAlignment;
    
    // placeHolder 默认颜色 字体
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor colorWithRed:170/255.0
                                                           green:173/255.0
                                                            blue:179/255.0
                                                           alpha:1/1.0];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:font];
    
    NSAttributedString *placeHolder = [[NSAttributedString alloc]initWithString:placeholder attributes:dict];
    textField.attributedPlaceholder = placeHolder;
    
    //关闭首字母大写
    textField.autocapitalizationType=NO;
    //清除按钮
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.rightViewMode=UITextFieldViewModeWhileEditing;
    
    textField.font= [UIFont systemFontOfSize:font];
    textField.textColor = [UIColor redColor];
    
    [view addSubview:textField];
    return textField ;
}




+ (UIWindow *)lastWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        
        if ([window isKindOfClass:[UIWindow class]] && CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            
            return window;
    }
    
    return [UIApplication sharedApplication].keyWindow;
}

@end

