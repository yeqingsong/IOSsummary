//
//  NSObject+Extend.m
//  SElAndIMP
//
//  Created by shoule on 2018/8/22.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "NSObject+Extend.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation NSObject (Extend)
//+(BOOL)resolveClassMethod:(SEL)sel{
//    return [[self class] resolveClassMethod:sel];
//}
//+(BOOL)resolveInstanceMethod:(SEL)sel{
//    NSLog(@"+++++++++++++++%@",NSStringFromSelector(sel));
//    if (sel == @selector(count)) {
//        NSLog(@"%@",self);
//        class_addMethod([self class], sel, (IMP)logCurrentStr, "i@:");
//        return YES;
//    }
//    return [self resolveInstanceMethod:sel];
//}
//int logCurrentStr(id class, SEL log){
//    NSLog(@"这货不是数组");
//    return 0;
//}
@end
