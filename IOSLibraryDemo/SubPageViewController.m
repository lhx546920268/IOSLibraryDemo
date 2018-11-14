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
    self.refreshEnable = YES;
    self.loadMoreEnable = YES;
    [self stopLoadMoreWithMore:YES];
}

- (void)onRefesh
{
    [self performSelector:@selector(stopRefresh) withObject:nil afterDelay:2.0];
}

- (void)onLoadMore
{
    [self performSelector:@selector(stopLoadMoreWithMore:) withObject:@(NO) afterDelay:2.0];
}

//- (Class)tableViewClass
//{
//    return [CustomTableView class];
//}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [super scrollViewWillBeginDragging:scrollView];
    [self.pageViewController.nestedTableViewController scrollViewWillBeginDragging:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [super scrollViewDidScroll:scrollView];
    [self.pageViewController.nestedTableViewController scrollViewDidScroll:scrollView];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [super scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
    [self.pageViewController.nestedTableViewController scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
