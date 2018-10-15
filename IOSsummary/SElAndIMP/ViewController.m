//
//  ViewController.m
//  SElAndIMP
//
//  Created by shoule on 2018/8/17.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "ViewController.h"
#import "subSelectModel.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "SecondViewController.h"
#import "ResponseViewController.h"
#import "ModifierViewController.h"
#import "LoadImageController.h"
extern NSString * myTestStr;
//extern NSString * myTestStr1;
NSString*const notificationCenter = @"NotificationCenter";
@interface ViewController ()
{
    int globalNUM;
}
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    globalNUM = 1;
//    NSInteger i = 10;
//    do{
//        i++;
//        NSLog(@"%ld",i);
//    }while (i<10);
    
    
    UIButton* button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(100,200, 100, 100);
    button2.backgroundColor = [UIColor yellowColor];
    [button2 addTarget:self action:@selector(clickButton1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton* button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(100,300, 100, 100);
    button3.backgroundColor = [UIColor greenColor];
    [button3 addTarget:self action:@selector(clickButton3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(popCurrent) name:notificationCenter object:nil];
    
    
    UIButton* button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(100,400, 100, 100);
    button4.backgroundColor = [UIColor blackColor];
    [button4 addTarget:self action:@selector(clickButton4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];

    
}
-(void)clickButton4{
    LoadImageController* vc =[[LoadImageController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)popCurrent{
    NSLog(@"人见人爱花见花开通知君");
    for (NSInteger i = 0; i<10000; i++) {
        i++;
    }
    NSLog(@"人见人爱花见花开通知君111111");
    dispatch_async(dispatch_get_main_queue(), ^{
        self.view.backgroundColor =  [UIColor grayColor];
    });
    
}
-(void)clickButton3{
    SecondViewController* vc = [[SecondViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    return;
    
   
    void (^blk)(void) = ^{//没有截获自动变量的Block
        NSLog(@"Stack Block");
    };
    blk();
    NSLog(@"%@",[blk class]);//打印:__NSGlobalBlock__
    
    
    static int j =10;
    
    void (^captureBlk)(void) = ^{//截获自动变量i的Block
        NSLog(@"Capture:%d", self->globalNUM);
        NSLog(@"Capture:%d", j);
    };
    globalNUM = 100;
    j = 10000;
    captureBlk();
    NSLog(@"%@",[captureBlk class]);//打印：__NSMallocBlock__
 
}

-(void)clickButton1{
//    ResponseViewController* vc = [[ResponseViewController alloc]init];
//    [self presentViewController:vc animated:YES completion:nil];
//    return;
    #pragma mark -- 消息转发机制的基本原理理解
    //https://www.jianshu.com/p/1073daee5b92
//    https://blog.csdn.net/lvmaker/article/details/32396167
    selectorModel* person = [[selectorModel alloc]init];
    [person TestCrruentLog11111111];
    [selectorModel testJiaHao];
    [person sleep];
    class_setVersion([self class], 3.0);
    class_setVersion([self class], 333333);
//    int num = class_getVersion([self class]);
    
    NSLog(@"%p",[person class]);
    NSLog(@"%p",object_getClass(person));
    NSLog(@"%p",object_getClass([person class]));
    NSLog(@"%p",object_getClass([selectorModel class]));
    NSLog(@"%p",[[person class] class]);

//    [person count];
//    [selectorModel testJiaHao];
    UIImage* image = [UIImage imageNamed:@"123123123"];
    
    NSMutableArray* arr = [NSMutableArray arrayWithObjects:@"12121",@"23232", nil];
    [arr addObject:@"111"];
    
    
    
    NSDictionary*dic = [NSDictionary dictionaryWithObjectsAndKeys:@"312313",@"1", nil];
    NSLog(@"%@",[dic objectForKey:@"1"]);
    
    
    NSLog(@"%@",myTestStr);
//    NSLog(@"%@",myTestStr1);
//    myTestStr1 = @"333333333333";
    myTestStr = @"213123";
    NSLog(@"%@",myTestStr);
//    NSLog(@"%@",myTestStr1);
    NSLog(@"%@",myTestStr2);
    
    
}

-(void)clickButton{
    ModifierViewController* vc = [[ModifierViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    
#pragma mark -- SEL和IMP原理
    //SEL : 类成员方法的指针，但不同于C语言中的函数指针，函数指针直接保存了方法的地址，但SEL只是方法编号。
    //IMP:一个函数指针,保存了方法的地址
    //系统通过SEL的编号，查找到IMP既方法地址调用方法
    //https://www.jianshu.com/p/4a09d5ebdc2c
    //https://www.jianshu.com/p/aff083ec3203
//    subSelectModel* model = [[subSelectModel alloc]init];
//    model.selectTest = @selector(TestCrruentLog);
//    [model performSelector:model.selectTest withObject:nil];
//    [model TestCrruentLog];
    
    
#pragma mark -- iOS内存布局
    //iOS内存
    //Objective-C内存布局http://www.cnblogs.com/ygm900/p/3698422.html
    //Objective-C中每个类都是一个类对象，NSObject是所有类对象的元类，具体见下面连接示意图
    //关于ios中isa的示例图 http://images.cnblogs.com/cnblogs_com/csutanyu/342406/r_Screen%20Shot%202011-12-13%20at%209.42.39%20PM.png
    
    //iOS内存区域分布 https://www.jianshu.com/p/3b07f92d44ca
    NSString* str1 = @"123";
    NSLog(@"str1 = %p, str1 = %@, str1=%x",str1,[str1 class],&str1);
    NSString* str2 = @"123";
    NSLog(@"str2 = %p, str2 = %@, str2=%x",str2,str2,&str2);
    //str1,str2的地址指向相同指向一个全局常量的地址
    //str3,str4,str5,str6的地址指向相同指向一个对象的地址
    NSString* str3 = [[NSString alloc]initWithFormat:@"123"];
    NSLog(@"str3 = %p, str3 = %@, str3=%x",str3,str3,&str3);
    NSString* str4 = [[NSString alloc]initWithFormat:@"123"];
    NSLog(@"str4 = %p, str4 = %@, str4=%x",str4,str4,&str4);
    NSString* str5 = [[NSString alloc]initWithString:str3];
    NSLog(@"str5 = %p, str5 = %@, str5=%x",str5,str5,&str5);
    NSString* str6 = [NSString stringWithFormat:@"123"];
    
//    str6 = @"123";
    NSLog(@"str6 = %p,str6 = %@, str6=%x",str6,str6,&str6);
    NSLog(@"str3 = %p, str3 = %@, str3=%x",str3,str3,&str3);
    
    NSMutableArray* myArray;
    NSString* strr = @"asdadsasda";
    void (^blk)(NSString* str)=^(NSString* str){
        NSLog(@"%@",str2);
//        NSMutableArray* arr = [[NSMutableArray alloc]init];
//        NSLog(@"arr = %p,arr = %@, arr=%x",arr,arr,&arr);
//        NSLog(@"str = %p,str = %@, str=%x",str,str,&str);
    };
    
//     NSLog(@"%@",[blk class]);
    NSLog(@"blk = %p,blk = %@, blk=%x",blk,blk,&blk);
    blk(str5);
     NSLog(@"%@",[blk class]);
    NSLog(@"%@-----%p===== %x  ",[^{NSLog(@"%@",str1);} class],[^{NSLog(@"%@",str1);} class],[^{NSLog(@"%@",str1);} class]);
    
    myArray = (NSMutableArray*)strr;
    [myArray count];
    [myArray count];
//    NSLog(@"%lu",(unsigned long)[myArray count]);
    NSMutableArray* arr = [NSMutableArray arrayWithObjects:@"12121",@"23232", nil];
    [arr addObject:@"111"];
//    [arr addObject:nil];
//    NSLog(@"%lu",(unsigned long)arr.count);
    NSLog(@"arr = %p,arr = %@, arr=%x",arr,arr,&arr);
    NSLog(@"arr = %p,arr = %@, arr=%x",[NSArray array],[NSArray array],[NSArray array]);
//    NSMutableArray* myArray1;
//    NSString* strr1 = @"asdadsasda";
//    myArray1 = (NSMutableArray*)strr1;
//    [myArray1 count];
//    0x104c57070
//    0x1012fa758

}

#pragma mark -- 数组、链表、堆栈、队列和树
//https://blog.csdn.net/wei78008023/article/details/50735415/
//数组顺序存储，链表非顺序存储，只要知道前后的元素就行
//堆栈先进后出，只有栈顶操作
//队列先进先出
//树二叉树结构

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
