//
//  ModifierModel.m
//  SElAndIMP
//
//  Created by shoule on 2018/9/12.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "ModifierModel.h"

@implementation ModifierModel
{
    NSMutableArray* _array;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        _name = @"我是爸爸";
        
    }
    return self;
}
///保护只读功能限制KVC改变
//+ (BOOL) accessInstanceVariablesDirectly{
//    return NO;
//}

@end






