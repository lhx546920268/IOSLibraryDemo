//
//  HitTestViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/4/24.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "HitTestViewController.h"

@interface SuperView : UIView

@property(nonatomic, weak) UIView *view;

@end

@implementation SuperView

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    NSLog(@"super");
    NSLog(@"%@", view);
    
    return view;
}

@end

@interface Subview : UIView

@end

@implementation Subview

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    NSLog(@"subview");
    NSLog(@"%@", view);
    
    return view;
}

- (UIResponder*)nextResponder
{
    UIResponder *responder = [self nextResponder];
    
    return responder;
}

@end

@interface HitTestViewController ()

@end

@implementation HitTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SuperView *sview = [SuperView new];
    sview.backgroundColor = [UIColor redColor];
    [sview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapSupview)]];
    [self.view addSubview:sview];
    
    [sview sea_centerInSuperview];
    [sview sea_sizeToSelf:CGSizeMake(150, 150)];
    
    Subview *view = [Subview new];
    view.backgroundColor = [UIColor cyanColor];
//    [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapSubview)]];
//    view.userInteractionEnabled = NO;
    [sview addSubview:view];
    
    sview.view = view;
    
    [view sea_centerInSuperview];
    [view sea_sizeToSelf:CGSizeMake(100, 100)];
}

- (void)handleTapSupview
{
    NSLog(@"handleTapSupview");
}

- (void)handleTapSubview
{
    NSLog(@"handleTapSubview");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
