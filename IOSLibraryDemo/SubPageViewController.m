//
//  SubPageViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/11.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "SubPageViewController.h"
#import "CustomTableView.h"

@interface SubPageViewController ()


@end

@implementation SubPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialization];
}

/**初始化视图 子类必须调用该方法
 */
- (void)initialization
{
    [self registerClass:[UITableViewCell class]];
    
    [super initialization];
}

- (Class)tableViewClass
{
    return [CustomTableView class];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.pageViewController.nestedTableViewController scrollViewWillBeginDragging:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.pageViewController.nestedTableViewController scrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.pageViewController.nestedTableViewController scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [self.pageViewController.nestedTableViewController scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self.pageViewController.nestedTableViewController scrollViewDidEndDecelerating:scrollView];
}

- (void)emptyViewWillAppear:(SeaEmptyView *)view
{
    if(![NSString isEmpty:self.title]){
        view.textLabel.text = [NSString stringWithFormat:@"暂无%@信息", self.title];
    }else{
        view.textLabel.text = @"暂无信息";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 130;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[UITableViewCell sea_nameOfClass] forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个", indexPath.row];
    
    return cell;
}

@end
