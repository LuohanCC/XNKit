//
//  UITextField+XNExtension.m
//  XNTools
//
//  Created by 罗函 on 2016/9/28.
//  Copyright © 2016年 罗函. All rights reserved.
//

#import "UITextField+XNExtension.h"
#import <objc/runtime.h>

NSString * const WJTextFieldDidDeleteBackwardNotification = @"com.whojun.textfield.did.notification";
@implementation UITextField (XNExtension)

+ (void)exchangeMethod:(Class)class originalMethodStr:(NSString *)originalMethodStr exchangeMethod:(SEL)exchangeMethodSel {
    Method originalMethod = class_getInstanceMethod(class, NSSelectorFromString(originalMethodStr));
    Method exchangeMethod = class_getInstanceMethod(class, exchangeMethodSel);
    /**
     *  在这里使用class_addMethod()函数对Method Swizzling做了一层验证，如果self没有实现被交换的方法，会导致失败。
     *  而且self没有交换的方法实现，但是父类有这个方法，这样就会调用父类的方法，结果就不是我们想要的结果了。
     *  所以我们在这里通过class_addMethod()的验证，如果self实现了这个方法，class_addMethod()函数将会返回NO，就可以对其进行交换了。
     */
    if (!class_addMethod(class, exchangeMethodSel, method_getImplementation(exchangeMethod), method_getTypeEncoding(exchangeMethod))) {
        method_exchangeImplementations(exchangeMethod, originalMethod);
    }
}

+ (void)load {
    [self exchangeMethod:[self class] originalMethodStr:@"deleteBackward" exchangeMethod:@selector(wj_deleteBackward)];
}

- (void)wj_deleteBackward {
    [self wj_deleteBackward];
    
    if ([self.delegate respondsToSelector:@selector(textFieldDidDeleteBackward:)])  {
        id <WJTextFieldDelegate> delegate  = (id<WJTextFieldDelegate>)self.delegate;
        [delegate textFieldDidDeleteBackward:self];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:WJTextFieldDidDeleteBackwardNotification object:self];
}
@end
