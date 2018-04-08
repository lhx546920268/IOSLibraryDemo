//
//  SubPageViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/11.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "SubPageViewController.h"

@interface SubPageViewController ()


@end

@implementation SubPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.label.userInteractionEnabled = YES;
    [self.label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.label.text = [NSString stringWithFormat:@"第%d个", (int)self.index + 1];
}

- (void)handleTap:(id) sender
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 1;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.repeatCount = HUGE_VAL;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint point = self.label.center;
    [path moveToPoint:point];
    [path addQuadCurveToPoint:CGPointMake(point.x + 100, point.y) controlPoint:CGPointMake(point.x + 50, point.y - 200)];
//    [path addCurveToPoint:point controlPoint1:CGPointMake(point.x + 100, point.y - 200) controlPoint2:CGPointMake(point.x + 200, point.y)];
    animation.path = path.CGPath;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = 2;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.frame = self.view.bounds;
    [self.view.layer addSublayer:layer];
    
    [self.label.layer addAnimation:animation forKey:@""];
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
