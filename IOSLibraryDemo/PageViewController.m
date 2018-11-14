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

@property(nonatomic, strong) NSMutableArray<SubPageViewController*> *subPages;

@property(nonatomic, weak) SubPageViewController *subPage;

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass([SeaPageViewController class]);
    NSArray *titles = @[@"平板电视", @"冰箱", @"家庭影院", @"洗衣机", @"空调", @"热水器", @"电风扇", @"微波炉"];
    self.subPages = [NSMutableArray arrayWithCapacity:titles.count];
    for(NSInteger i = 0;i < titles.count;i ++){
        SubPageViewController *page = [SubPageViewController new];
        page.index = i;
        page.pageViewController = self;
        [self.subPages addObject:page];
    }
    self.menuBar.titles = titles;
    
    [self initialization];
}

- (UIScrollView*)currentScrollView
{
    return self.subPage.tableView;
}

- (UIViewController*)viewControllerForIndex:(NSUInteger)index
{
    return self.subPages[index];
}

- (void)onScrollTopPage:(NSInteger)page
{
    self.subPage = self.subPages[page];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.nestedTableViewController.tableView.scrollEnabled = NO;
    self.currentScrollView.scrollEnabled = NO;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    self.nestedTableViewController.tableView.scrollEnabled = YES;
    self.currentScrollView.scrollEnabled = YES;
}

@end
