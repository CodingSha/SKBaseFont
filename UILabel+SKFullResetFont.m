//
//  UILabel+SKFullResetFont.m
//  SKZQ
//
//  Created by 沙少盼 on 16/9/20.
//  Copyright © 2016年 时刻足球. All rights reserved.
//

#import "UILabel+SKFullResetFont.h"

@implementation UILabel (SKFullResetFont)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector4 = @selector(setFont:);
        SEL swizzledSelector4 = @selector(SSPSetFont:);
        Method originalMethod4 = class_getInstanceMethod(class, originalSelector4);
        Method swizzledMethod4 = class_getInstanceMethod(class, swizzledSelector4);
        BOOL didAddMethod4 =
        class_addMethod(class,
                        originalSelector4,
                        method_getImplementation(swizzledMethod4),
                        method_getTypeEncoding(swizzledMethod4));
        if (didAddMethod4) {
            class_replaceMethod(class,
                                swizzledSelector4,
                                method_getImplementation(originalMethod4),
                                method_getTypeEncoding(originalMethod4));
        }else {
            method_exchangeImplementations(originalMethod4, swizzledMethod4);
        }
    });
}
/** 全局整体强制改变所有字体 */
- (void)SSPSetFont:(UIFont *)font{
    NSString *fontName = @"HiraginoSans-W3";
    /** 可以在此添加代码,以便排除某些个别不需要改变的字体 */
    if ([font.fontName isEqual:@"HiraginoSans-W6"]) {
        fontName = font.fontName;
    }
    [self SSPSetFont:[UIFont fontWithName:fontName size:font.pointSize]];
}
@end
