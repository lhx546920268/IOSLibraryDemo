//
//  PageViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/11.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "PageViewController.h"
#import "SubPageViewController.h"
#import <SeaMenuBar.h>

@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass([SeaPageViewController class]);
    NSArray *titles = @[@"平板电视", @"冰箱", @"家庭影院", @"洗衣机", @"空调", @"热水器", @"电风扇", @"微波炉"];
    self.menuBar.titles = titles;
    
    [self initialization];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController*)viewControllerForIndex:(NSUInteger)index
{
    SubPageViewController *page = [SubPageViewController new];
    page.index = index;
    
    return page;
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
