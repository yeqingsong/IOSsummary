//
//  NSDictionary+extend.m
//  SElAndIMP
//
//  Created by shoule on 2018/8/23.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "NSDictionary+extend.h"
#import <objc/runtime.h>
@implementation NSDictionary (extend)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        Class class = [self class];
        Class class = objc_getClass("__NSDictionaryM");
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(objectForKey:);
        SEL swizzledSelector = @selector(MYobjectForKey:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        
        BOOL didAddMethod = class_addMethod(class,
                                            originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
//        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
    
}
-(id)MYobjectForKey:(id)object{
    NSLog(@"调用了新的方法");
    if (object) {
        return [self MYobjectForKey:object];
    }
    return [self MYobjectForKey:object];
}
@end
