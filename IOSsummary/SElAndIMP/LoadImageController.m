//
//  LoadImageController.m
//  SElAndIMP
//
//  Created by shoule on 2018/9/20.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "LoadImageController.h"
#import <objc/runtime.h>
#import "selectorModel.h"
@interface LoadImageController ()

@end

@implementation LoadImageController

- (void)viewDidLoad {
    [super viewDidLoad];
//    Method method1 = class_getInstanceMethod([self class], @selector(doSonmethings));
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view from its nib.
    
     [self addObserver:self forKeyPath:NSStringFromSelector(@selector(doSonmethings)) options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)clickButton{
//    [self doSonmethings];
    selectorModel* model = [[selectorModel alloc]init];
    model.sex = @"0";
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
    
    NSArray *array= [NSArray arrayWithObjects:@"1",@"2",@"2.3",@"3.0",@"4.0",@"10",nil];
    
    CGFloat sum = [[array valueForKeyPath:@"@sum.floatValue"] floatValue];
    
    CGFloat avg = [[array valueForKeyPath:@"@avg.floatValue"] floatValue];
    
    CGFloat max =[[array valueForKeyPath:@"@max.floatValue"] floatValue];
    
    CGFloat min =[[array valueForKeyPath:@"@min.floatValue"] floatValue];
    

    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"监听到了%@的%@属性发生了改变", object, keyPath);
    NSLog(@"%@", change);
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
