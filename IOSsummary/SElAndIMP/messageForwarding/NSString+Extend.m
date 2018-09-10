//
//  NSString+Extend.m
//  SElAndIMP
//
//  Created by shoule on 2018/8/22.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "NSString+Extend.h"
#import <objc/message.h>
#import "selectorModel.h"
@implementation NSString (Extend)
+(BOOL)resolveClassMethod:(SEL)sel{
    return [super resolveClassMethod:sel];
}
+(BOOL)resolveInstanceMethod:(SEL)sel{
    NSLog(@"+++++++++++++++%@",NSStringFromSelector(sel));
    if (sel == @selector(count)) {
        NSLog(@"%@",self);
        class_addMethod([self class], sel, (IMP)logCurrentStr, "i@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
int logCurrentStr(id class, SEL log){
    NSLog(@"这货不是数组");
    return 0;
}
-(id)forwardingTargetForSelector:(SEL)aSelector{
//    https://blog.csdn.net/lvmaker/article/details/32396167
    if (![[self class]respondsToSelector:aSelector]) {
//        Obj-C的方法（method）就是一个至少需要两个参数（self，_cmd）的C函数，这个函数仅仅输出一句Hello。接下来在addMethod方法中，我们调用class_addMethod()为EmptyClass添加方法，class_addMethod()是这样定义的：
//        BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
//        参数说明：
//        cls：被添加方法的类
//        name：可以理解为方法名，这个貌似随便起名，比如我们这里叫sayHello2
//        imp：实现这个方法的函数
//        types：一个定义该函数返回值类型和参数类型的字符串
        NSLog(@"%@",[self class]);
        selectorModel* model = [[selectorModel alloc]init];
        class_addMethod([model class], aSelector, (IMP)logCurrentStr, "i@:");
        //        types参数为"i@:@“，按顺序分别表示：
        //        i：返回值类型int，若是v则表示void
        //        @：参数id(self)
        //        :：SEL(_cmd)
        //        @：id(str)
        return model;
    }
    return [super forwardingTargetForSelector:aSelector];
}

+(void)load{
    //最早的方法，比main还早
    NSLog(@"load");
    
    
}
@end
