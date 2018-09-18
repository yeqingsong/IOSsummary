//
//  SecondViewController.m
//  SElAndIMP
//
//  Created by shoule on 2018/9/4.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "SecondViewController.h"
#import "CategoryText.h"
#import "CategoryText+Extrend.h"
#import <objc/runtime.h>
#import "ViewController.h"

//extern NSString* notificationCenter;
@interface SecondViewController ()
{
    NSInteger _tickets ;
    NSLock* _lock;
}
@end
__weak id objTrace;
@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton* button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(100, 200, 100, 100);
    button1.backgroundColor = [UIColor blueColor];
    [button1 addTarget:self action:@selector(clickButton1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    unsigned int count;
   
    Method *methods = class_copyMethodList([ViewController class], &count);
//    id mothem = (__bridge id)(class_getClassMethod([ViewController class], nil));
    for (int i = 0; i<count; i++) {
        Method  method = methods[i];
        SEL select = method_getName(method);
        NSLog(@"%@",NSStringFromSelector(select));
    }
    
    NSArray *localArr = [NSArray arrayWithObject:@"Weng Zilin"];//这是一个局部对象，封装了autorelease方法
    objTrace = localArr;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear__localArr:%@", objTrace);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewWillAppear__localArr:%@", objTrace);
}
#pragma mark --
-(void)clickButton1{
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [[NSNotificationCenter defaultCenter]postNotificationName:notificationCenter object:nil];
//    });
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
   
//    NSCondition *lock = [[NSCondition alloc] init];
    NSLock* lock = [[NSLock alloc]init];
    //Son 线程
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self testNSLock];
//        int i = 10;
//        [lock lock];
//        //        [lock wait];
//        while (i<20) {
//            i++;
//
//
//            NSLog(@"%d",i);
//        }
//
//        NSLog(@"The money has been used up.");
//        [lock unlock];
    });
    
    //Father线程
    [self performSelector:@selector(unlockAsync:) withObject:lock afterDelay:5];
   

    
    NSLog(@"我们的人生");
}
-(void)testNSLock{
    
    NSRecursiveLock *lock = [[NSRecursiveLock alloc] init];
//    NSLock *lock = [[NSLock alloc] init];
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        static void (^RecursiveBlock)(int);
        RecursiveBlock = ^(int value) {
            [lock lock];
            
            if (value > 0) {
                NSLog(@"加锁层数 %d", value);
                sleep(1);
                RecursiveBlock(--value);
            }
            
            [lock unlock];
        };
        RecursiveBlock(3);
    });
    
}
-(void)unlockAsync:(NSCondition*)lock{
//    [lock signal];
}
#pragma mark -- 锁synchronized
-(void)clickButton{
   NSMutableString* muStr2 = [NSMutableString stringWithString:@"1"];
    for(int i=0; i<20; i+=1){
        NSNumber *number = @([muStr2 longLongValue]);
        NSLog(@"%@, %p", [number class], number);
        [muStr2 appendString:@"1"];
    }
    
    
    CategoryText* model = [[CategoryText alloc]init];
    model.age = @"12";
    [CategoryText changeAge];
    model.height = @"21213123";
//    model.weight = @"333333";
    NSLog(@"%@ %@",model.height,model.class);
    [model changeAge1];
    NSLog(@"-----------%@ %@",model.height,model.class);
    _tickets = 10;
    dispatch_queue_t serialQueue = dispatch_queue_create("com.example.SerialQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t serialQueue1 = dispatch_queue_create("com.example.serialQueue1", DISPATCH_QUEUE_CONCURRENT);
    _lock = [[NSLock alloc]init];
    dispatch_async(serialQueue, ^{
//        [lock lock];
        [self saleTickets];
//        [lock unlock];
    });
    dispatch_async(serialQueue, ^{
//        [lock lock];
        [self saleTickets];
//        [lock unlock];
    });
    
    
    dispatch_async(serialQueue1, ^{
        //        [lock lock];
        [self saleTickets];
        //        [lock unlock];
    });
    dispatch_async(serialQueue1, ^{
        //        [lock lock];
        [self saleTickets];
        //        [lock unlock];
    });
    
    
}
- (void)saleTickets
{
    
    while (1) {
        @synchronized(self) {
//        [_lock lock];
            [NSThread sleepForTimeInterval:1];
            
            if (_tickets > 0) {
                _tickets--;
                NSLog(@"剩余票数= %ld, Thread:%@",(long)_tickets,[NSThread currentThread]);
            } else {
                NSLog(@"票卖完了  Thread:%@",[NSThread currentThread]);
                break;
            }
//        [_lock unlock];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
