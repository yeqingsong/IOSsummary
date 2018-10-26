//
//  UIApplicationclass.m
//  SElAndIMP
//
//  Created by shoule on 2018/9/21.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "UIApplicationclass.h"
#import <objc/runtime.h>
@implementation UIApplicationclass
//-(void)sendMYEvent:(UIEvent *)event{
//    [self sendMYEvent:event];
//    NSSet *viewSet = event.allTouches;
//    NSArray* array = [viewSet allObjects];
//    if (array) {
//        NSLog(@"%@",array);
//    }
//}
//-(void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        SEL select = @selector(sendEvent:);
//        SEL myselect = @selector(sendMYEvent:);
//        Method method1 = class_getInstanceMethod([self class], select);
//        Method method2 = class_getInstanceMethod([self class], myselect);
//        BOOL isAddMethod = class_addMethod([self class], select, method_getImplementation(method2), method_getTypeEncoding(method2));
//        if (isAddMethod) {
//            class_replaceMethod([self class], myselect, method_getImplementation(method1), method_getTypeEncoding(method1));
//        }else{
//            method_exchangeImplementations(method1, method2);
//        }
//    });
//}

@end
