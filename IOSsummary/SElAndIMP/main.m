//
//  main.m
//  SElAndIMP
//
//  Created by shoule on 2018/8/17.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"load111111");
//        1.argc和argv参数是为了与C语言保持一致，在这没用到，不详述。
//
//        2.后面两个参数为principalClassName(主要类名)和delegateClassName(委托类名)。
//
//        　　(1)如果principalClassName是nil，那么它的值将从Info.plist中获取，如果Info.plist中没有，则默认为UIApplication。principalClass这个类除了管理整个程序的生命周期之外什么都不做，它只负责监听事件然后交给delegateClass去做。
//
//        　　(2)delegateClass将在工程新建时实例化一个对象。NSStringFromClass([AppDelegate class]) //相当于@"AppDelegate"
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
    }
}
