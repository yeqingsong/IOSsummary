//
//  ResponseViewController.m
//  SElAndIMP
//
//  Created by shoule on 2018/9/10.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "ResponseViewController.h"
#import "UIView+Extrend.h"
#import "UIResponder+Extrend.h"
#import "ResponseViewCell.h"
#import "redView.h"
#import "blackView.h"
@interface ResponseViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIView *tableSupperView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet redView *redView;
@property (weak, nonatomic) IBOutlet blackView *blackView;
@property (weak, nonatomic) IBOutlet UIButton *centerButton;

@end

@implementation ResponseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickView:)];
//    tap.cancelsTouchesInView = NO;
//    tap.delegate = self;
    [self.tableSupperView addGestureRecognizer:tap];
    
    
    UITapGestureRecognizer* tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickView:)];
//    tap1.cancelsTouchesInView = NO;
    //    tap.delegate = self;
    [self.blackView addGestureRecognizer:tap1];
    
    
    UITapGestureRecognizer* tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickView:)];
    //    tap1.cancelsTouchesInView = NO;
    //    tap.delegate = self;
    [self.centerButton addGestureRecognizer:tap2];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch* touch in touches) {
        NSLog(@"+++++++++++++++%@",[touch.view class]);
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 输出点击的view的类名
    NSLog(@"%@", NSStringFromClass([touch.view class]));
    
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return  YES;
}
-(void)clickView:(UITapGestureRecognizer*)tap{
    NSLog(@"++++++++++++++++++++++++%@",[tap.view class]);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ResponseViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ResponseViewCell" owner:self options:nil]lastObject];
    }
    
    cell.textLabel.text = @"11111111111111111";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"1234567890");
    
}
- (IBAction)clickButton:(UIButton*)sender {
    [sender routerWithEventName:@"sender" userInfo:[NSString stringWithFormat:@"%ld",sender.tag]];
}
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    return self.view;
//}
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    return YES;
//}
-(void)routerWithEventName:(NSString *)eventName userInfo:(NSString *)modelInfo{
    NSLog(@"%@",modelInfo);
    if (self.nextResponder) {
        [self.nextResponder routerWithEventName:eventName userInfo:modelInfo];
        
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
