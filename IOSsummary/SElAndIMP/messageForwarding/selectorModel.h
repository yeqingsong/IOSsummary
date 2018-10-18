//
//  selectorModel.h
//  SElAndIMP
//
//  Created by shoule on 2018/8/17.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectName.h"
///全局变量
extern NSString * myTestStr;
///静态变量
static NSString * const myTestStr1 = @"myTestStr1";
///全局常量
extern NSString * const myTestStr2 ;
@interface selectorModel : NSObject
@property (nonatomic,assign) SEL selectTest;//方法指针
@property (nonatomic,copy) NSString* sex;
-(void)TestParentMethod;
-(void)TestCrruentLog;
+(void)testJiaHao;
-(void)TestCrruentLog11111111;
-(void)count;
-(void)sleep;
@end
