//
//  UIImage+extend.m
//  SElAndIMP
//
//  Created by shoule on 2018/8/23.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "UIImage+extend.h"
#import <objc/runtime.h>
@implementation UIImage (extend)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(imageNamed:);
        SEL swizzledSelector = @selector(MYimageNamed:);
        
        Method originalMethod = class_getClassMethod(class, originalSelector);
        Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        
//        BOOL didAddMethod = class_addMethod(class,
//                                            originalSelector,
//                                            method_getImplementation(swizzledMethod),
//                                            method_getTypeEncoding(swizzledMethod));
//
//        if (didAddMethod) {
//            class_replaceMethod(class,
//                                swizzledSelector,
//                                method_getImplementation(originalMethod),
//                                method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
    
}
+(UIImage*)MYimageNamed:(NSString*)object{
//    NSLog(@"调用了新的方法");
    if (object) {
        [[UIImage class] MYimageNamed:object];
    }
    return [[UIImage class] MYimageNamed:object];
}
@end
