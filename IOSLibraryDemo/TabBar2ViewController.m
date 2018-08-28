//
//  TabBar2ViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/19.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "TabBar2ViewController.h"

@interface TabBar2ViewController ()

@end

@implementation TabBar2ViewController

+ (void)initialize
{
    NSLog(@"TabBar2ViewController init");
}

+ (void)load
{
    NSLog(@"TabBar2ViewController load");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发现";
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

@interface TabBar2ViewControllerSub : TabBar2ViewController

@end

@implementation TabBar2ViewControllerSub

+ (void)initialize
{
    NSLog(@"TabBar2ViewControllerSub init");
}

+ (void)load
{
    NSLog(@"TabBar2ViewControllerSub cate1 load");
}

@end

@interface TabBar2ViewController(Cate1)

@end

@implementation TabBar2ViewController(Cate1)

+ (void)initialize
{
    NSLog(@"TabBar2ViewController cate1 init");
}

+ (void)load
{
    NSLog(@"TabBar2ViewController cate1 load");
}

@end
