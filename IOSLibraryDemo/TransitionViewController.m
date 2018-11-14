//
//  TransitionViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/23.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "TransitionViewController.h"
#import <SeaPartialPresentTransitionDelegate.h>
#import "TableViewController.h"

@interface TransitionViewController ()<UIPopoverPresentationControllerDelegate>

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Transition";
    
    
    [self.horizontalBtn addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
    [self.horizontalBtn addTarget:self action:@selector(touchCancel) forControlEvents:UIControlEventTouchCancel];
    [self.horizontalBtn addTarget:self action:@selector(touchUpInside) forControlEvents:UIControlEventTouchUpInside];
    
    [self sea_setRightItemWithImage:[UIImage imageNamed:@"home_n"] action:@selector(touchDown)];
//    [self sea_setRightItemWithTitle:@"你好" action:@selector(touchDown)];
}

- (void)touchDown
{
    NSLog(@"touchDown");
    [self performSelector:@selector(longPress) withObject:self afterDelay:1.0];
}

- (void)touchCancel
{
    NSLog(@"touchCancel");
}

- (void)touchUpInside
{
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(longPress) object:nil];
    NSLog(@"touchUpInside");
}

- (void)longPress
{
    NSLog(@"longPress");
}

- (IBAction)horizontal:(id)sender {
    
    TableViewController *vc = [TableViewController new];
    vc.view.frame = CGRectMake(0, 0, self.view.width - 100, self.navigationController.view.height);
    [SeaPartialPresentTransitionDelegate pushViewController:vc inViewController:self];
}


- (IBAction)vertical:(UIButton*)sender {

//    UIPopoverPresentationController
    UINavigationController *vc = [[TableViewController new] sea_createWithNavigationController];
    vc.view.height = 300;
    [SeaPartialPresentTransitionDelegate presentViewController:vc inViewController:self];
}

//实现代理方法
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController*)controller{
    //返回UIModalPresentationNone为不匹配
    return UIModalPresentationNone;}

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
