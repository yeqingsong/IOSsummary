//
//  ModifierModel.h
//  SElAndIMP
//
//  Created by shoule on 2018/9/12.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "selectorModel.h"
@interface ModifierModel : NSObject
@property (nonatomic,readonly,copy) NSString* name;
@property (nonatomic,strong) NSMutableArray* array;
@property (atomic,strong) NSMutableArray* atomicArray;
@property (nonatomic,assign) NSMutableArray* assignArray;
@property (nonatomic,weak) NSMutableArray* weakArray;
@property (nonatomic,copy) NSString* copAge;
@property (nonatomic,strong) NSString* strongAge;
@end
