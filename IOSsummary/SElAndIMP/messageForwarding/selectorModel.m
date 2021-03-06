//
//  selectorModel.m
//  SElAndIMP
//
//  Created by shoule on 2018/8/17.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "selectorModel.h"
#import <objc/runtime.h>
#import <objc/message.h>

NSString *  myTestStr = @"myTestStr";
NSString * const myTestStr2 =@"extern NSString * const myTestStr2 ";

@implementation selectorModel
//*          代表  char *
//char BOOL  代表  c
//:          代表  SEL
//^type      代表  type *
//@          代表  NSObject * 或 id
//^@         代表  NSError **
//#          代表  NSObject
//v          代表  void
-(void)TestParentMethod{
    NSLog(@"TestParentMethod");
}
-(void)TestCrruentLog{
    NSLog(@"TestCrruentLog");
}
void testCurrent(id Class,SEL _asdasdasdasd){
    NSLog(@"TestCrruentLog111111111111111");
    NSLog(@"%@",myTestStr);
}

+(BOOL)resolveClassMethod:(SEL)sel{
     NSLog(@"resolveInstanceMethod: %@", NSStringFromSelector(sel));
    if (sel == @selector(testJiaHao)) {
        NSLog(@"testCurrentSelector");
//在这个方法里不能直接使用class_addMethod，我也不知道为啥。。。。。可能class_addMethod只能创建实例类方法，因此可以在这里调用resolveInstanceMethod方法，在resolveInstanceMethod方法中实现未找到类方法
//        class_addMethod(objc_getClass([NSStringFromClass([self class])UTF8String]),sel,(IMP)testCurrent,"v#:");
        
//        class_addMethod([self class],sel, class_getClassMethod([self class], @selector(tihuan)),"v@:");
        
        
        
        
//        class_addMethod(object_getClass(self),sel, class_getMethodImplementation(object_getClass(self), @selector(tihuan)),"v#:");
//        object_getClass(<#id  _Nullable obj#>)
        NSLog(@"%s",object_getClassName([self class]));
        NSLog(@"%p",object_getClass(self));
        NSLog(@"%p",[self class]);
        const char *  m = (const char *)class_getClassMethod(object_getClass(self), @selector(tihuan));
        
         class_addMethod(object_getClass(self),sel, class_getMethodImplementation(object_getClass(self), @selector(tihuan)),m/*"v#:"*/);
        
        //调用resolveInstanceMethod方法使用self和【self class】都没错，个人认为是系统会一直查询到NSObject层，而NSObject类的实例类和元类都是他自己
//        [[self class] resolveInstanceMethod:sel];
        return YES;
    }
     return[super resolveClassMethod:sel];
}
+(void)tihuan{
    NSLog(@"23231313");
}
+(BOOL)resolveInstanceMethod:(SEL)sel{
    NSLog(@"resolveInstanceMethod: %@", NSStringFromSelector(sel));
    
    if(sel ==@selector(TestCrruentLog11111111)) {
        const char *  m = (const char *)class_getClassMethod(object_getClass(self), @selector(TestCrruentLog));
        class_addMethod([self class], sel, class_getMethodImplementation(self, @selector(TestCrruentLog)),"v@:");
        class_getName(self);
        class_setVersion([self class], 3.0);
        NSLog(@"%d",class_getVersion(self));
        return YES;

    }
    return[super resolveInstanceMethod:sel];
  
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSString *sel = NSStringFromSelector(aSelector);
    // 判断要转发的SEL
    if ([sel isEqualToString:@"sleep"]) {
        // 为转发的方法手动生成签名
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL selector = [anInvocation selector];
    // 新建需要转发消息的对象
    ProjectName *child = [[ProjectName alloc] init];
    id class = object_getClass(child);
    if ([class respondsToSelector:selector]) {
        // 唤醒这个方法
        [anInvocation invokeWithTarget:class];
    }
}

@end
