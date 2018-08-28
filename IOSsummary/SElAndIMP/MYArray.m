//
//  MYArray.m
//  SElAndIMP
//
//  Created by shoule on 2018/8/23.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "MYArray.h"
#import <objc/runtime.h>
@implementation MYArray
//+(void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        //        class_get
//        Method currentM = class_getInstanceMethod(self, @selector(addObject:));
//        Method systemM = class_getInstanceMethod(self, @selector(addNewObject:));
//        //    class_replaceMethod(self, <#SEL  _Nonnull name#>, <#IMP  _Nonnull imp#>, <#const char * _Nullable types#>)
//        method_exchangeImplementations(currentM, systemM);
//        //        NSLog(@"%@",objc_getClass(self));
//    });
//    
//}
//-(void)addNewObject:(id)object{
//    if (object) {
//        [self addNewObject:object];
//    }
//}

@end
