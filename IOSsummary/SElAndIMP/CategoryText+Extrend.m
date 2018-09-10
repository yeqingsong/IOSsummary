//
//  CategoryText+Extrend.m
//  SElAndIMP
//
//  Created by shoule on 2018/9/4.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "CategoryText+Extrend.h"
#import <objc/runtime.h>
@implementation CategoryText (Extrend)
static char *heightKey = "heightKey";
static char *weightKey = "weightKey";
//+(void)changeAge{
//    NSLog(@"myAge");
//}
-(void)setHeight:(NSString *)height{
    objc_setAssociatedObject(self, heightKey, height, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}
-(NSString* )height{
    return objc_getAssociatedObject(self, heightKey);
}
-(void)setWeight:(NSString *)weight{
    objc_setAssociatedObject(self, weightKey, weight, OBJC_ASSOCIATION_COPY);
}
-(NSString* )weight{
    return objc_getAssociatedObject(self, weightKey);
}
-(void)changeAge1{
    self.height = @"cateGory";
}
@end
