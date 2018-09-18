//
//  ModifierViewController.m
//  SElAndIMP
//
//  Created by shoule on 2018/9/12.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "ModifierViewController.h"
#import "ModifierModel.h"
@interface ModifierViewController ()

@end

@implementation ModifierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
-(void)clickButton{
#pragma mark -- readOnly修饰
    ModifierModel* model = [[ModifierModel alloc]init];
    NSLog(@"%@",model.name);
    ///使用KVC修改只读属性
    [model setValue:@"我是你爹" forKey:NSStringFromSelector(@selector(name))];
    NSLog(@"%@",model.name);
    
#pragma mark -- 线程不安全的例子
//    model.array = [NSMutableArray array];
////    NSLock* lock = [[NSLock alloc]init];
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
////        [lock lock];
//        for (int i = 0; i<5000; i++) {
//            [model.array addObject:[NSString stringWithFormat:@"%d",i]];
//        }
////        [lock unlock];
//    });
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
////        [lock lock];
//        for (int i = 0; i<10; i++) {
//            NSLog(@"%ld",model.array.count);
//            ///十次打印出每次的数组长度都不一样,如果要做一些操作可能得不到我们想要的结果线程不安全的例子
//        }
////        [lock unlock];
//    });
//    NSLog(@"我比线程先做完");
#pragma mark -- assign和weak修饰符
    model.assignArray = [NSMutableArray array];
    ///assignArray创建后就被立即销毁了但指针仍然指向被销毁的地址变成了野指针,赋值crash
//    [model.assignArray addObject:@"ads1"];
    model.weakArray = [NSMutableArray array];
    ///assignArray创建后就被立即销毁了变成了野指针,赋值crash
    [model.weakArray addObject:@""];
    
    
#pragma mark -- 浅copy与深copy
    NSArray* array = [NSArray arrayWithObjects:@"asdad", nil];
    ///不完全深copy开辟新的内存地址空间但是内部元素地址空间没变
    NSArray*copyArray1 = [array copy];
    NSArray*mutableArray1 = [array mutableCopy];
    NSLog(@"array    %p   %p",array,array[0]);
    NSLog(@"copyArray    %p   %p",copyArray1,copyArray1[0]);
    NSLog(@"mutableArray    %p   %p",mutableArray1,mutableArray1[0]);
    
    model.array = [NSMutableArray arrayWithObjects:@"asdad", nil];
    ///不完全深copy开辟新的内存地址空间但是内部元素地址空间没变
    NSArray*copyArray = [model.array copy];
    NSArray*mutableArray = [model.array mutableCopy];
    ///完全深copy开辟新的内存地址空间,内部元素通过归档解档创建新的地址空间
    NSArray*UnarchiverArray = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:mutableArray]];
    NSLog(@"model.array    %p   %p",model.array,model.array[0]);
    NSLog(@"copyArray    %p   %p",copyArray,copyArray[0]);
    NSLog(@"mutableArray    %p   %p",mutableArray,mutableArray[0]);
    NSLog(@"UnarchiverArray    %p   %p",UnarchiverArray,UnarchiverArray[0]);
    
    NSString* str = @"我18";
    model.copAge = str;
    model.strongAge = str;
    str = @"我19";
    NSLog(@"------%@+++++++++%@",model.copAge,model.strongAge);
    
    
    NSString* str1 = [NSString stringWithFormat:@"他20"];
    model.copAge = str;
    model.strongAge = str;
    str1 = @"他21";
    NSLog(@"------%@+++++++++%@",model.copAge,model.strongAge);
    
    NSMutableString* str2 = [NSMutableString stringWithFormat:@"她22"];
    model.copAge = str2;
    model.strongAge = str2;
    [str2 appendString:@"23"];
    NSLog(@"------%@+++++++++%@",model.copAge,model.strongAge);
    
    NSMutableString* str3 = [[NSMutableString alloc]initWithFormat: @"ta24"];
    model.copAge = str3;
    model.strongAge = str3;
    [str3 appendString:@"2"];
    NSLog(@"------%@+++++++++%@",model.copAge,model.strongAge);
    
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
