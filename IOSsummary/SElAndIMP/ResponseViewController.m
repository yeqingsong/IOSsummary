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
@interface ResponseViewController ()

@end

@implementation ResponseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
