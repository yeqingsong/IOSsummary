//
//  UIResponder+Extrend.m
//  SElAndIMP
//
//  Created by shoule on 2018/9/10.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "UIResponder+Extrend.h"

@implementation UIResponder (Extrend)
- (void)routerWithEventName:(NSString *)eventName userInfo:(NSString *)userInfo {
    ///通过响应链nextResponder一直向下查找,查找到有视图响应routerWithEventName为止停止查找,如果想继续进行查找,在响应方法中继续调用[self.nextResponder routerWithEventName:eventName userInfo:userInfo];
    if (self.nextResponder) {
        NSLog(@"--------------------%@",self.nextResponder);
        [self.nextResponder routerWithEventName:eventName userInfo:userInfo];
    }
}

@end
