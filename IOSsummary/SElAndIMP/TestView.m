//
//  TestView.m
//  SElAndIMP
//
//  Created by shoule on 2018/9/11.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "TestView.h"
#import "blackView.h"
@implementation TestView
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"testView");
}
//-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    UIView* view = [super hitTest:point withEvent:event];
//    NSLog(@"%ld",self.subviews.count);
//    for (UIView* view in self.subviews) {
//        if ([view isKindOfClass:[blackView class]]) {
//            return view;
//        }
//    }
////    if (view) {
////        <#statements#>
////    }
//    
//    return view;
//}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
