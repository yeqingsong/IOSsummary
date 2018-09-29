//
//  UIView+Extrend.m
//  SElAndIMP
//
//  Created by shoule on 2018/9/10.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "UIView+Extrend.h"
#import <objc/runtime.h>
@implementation UIView (Extrend)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL sysSEL = @selector(hitTest:withEvent:);
//        SEL sysSEL = @selector(canBecomeFirs);
        SEL currentSEL = @selector(current_hitTest:withEvent:);
//        SEL currentSEL = @selector(changeCurrent);
        Method sysMethod = class_getInstanceMethod([self class], sysSEL);
        Method currentMethod = class_getInstanceMethod([self class], currentSEL);
        ///只有当方法未实现才会返回yes
        BOOL didAddMethod = class_addMethod([self class], sysSEL, method_getImplementation(currentMethod), method_getTypeEncoding(currentMethod));
        if (didAddMethod) {
            class_replaceMethod([self class], currentSEL, method_getImplementation(sysMethod), method_getTypeEncoding(sysMethod));
        }else{
            method_exchangeImplementations(sysMethod, currentMethod);
        }
        
        
        SEL sysSEL1 = @selector(touchesBegan:withEvent:);
        //        SEL sysSEL = @selector(canBecomeFirs);
        SEL currentSEL1 = @selector(current_touchesBegan:withEvent:);
        //        SEL currentSEL = @selector(changeCurrent);
        Method sysMethod1 = class_getInstanceMethod([self class], sysSEL1);
        Method currentMethod1 = class_getInstanceMethod([self class], currentSEL1);
        ///只有当方法未实现才会返回yes
        BOOL didAddMethod1 = class_addMethod([self class], sysSEL1, method_getImplementation(currentMethod1), method_getTypeEncoding(currentMethod1));
        if (didAddMethod1) {
            class_replaceMethod([self class], currentSEL1, method_getImplementation(sysMethod1), method_getTypeEncoding(sysMethod1));
        }else{
            method_exchangeImplementations(sysMethod1, currentMethod1);
        }
    });
}
//-(void)changeCurrent{
//    [self changeCurrent];
//}
//-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event
-(UIView*)current_hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%@ %s",[self class], __PRETTY_FUNCTION__);
   return  [self current_hitTest:point withEvent:event];
}
-(void)current_touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%@ %s",[self class], __PRETTY_FUNCTION__);
}


@end
