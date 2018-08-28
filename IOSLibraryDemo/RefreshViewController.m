//
//  RefreshViewController.m
//  IOSLibraryDemo
//
//  Created by luohaixiong on 2018/7/20.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "RefreshViewController.h"
#import <SeaLoadMoreControl.h>

@interface RefreshViewController ()

@property(nonatomic, assign) int count;

@end

@implementation RefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.count = 30;
    
    [self initialization];
}

- (void)initialization
{
    self.tableView.rowHeight = 50;
    self.refreshEnable = YES;
    self.loadMoreEnable = YES;
    [self stopLoadMoreWithMore:YES];
    self.loadMoreControl.autoLoadMore = NO;
    [super initialization];
}

- (void)onRefesh
{
    [self performSelector:@selector(refreshFinish) withObject:nil afterDelay:2.0];
}

- (void)refreshFinish
{
    self.count = 30;
    [self.tableView reloadData];
    [self stopRefresh];
}

- (void)onLoadMore
{
    [self performSelector:@selector(loadMoreFinish) withObject:nil afterDelay:2.0];
}

- (void)loadMoreFinish
{
    self.count += 20;
    [self.tableView reloadData];
    [self stopLoadMoreWithMore:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%d个标题", (int)indexPath.row + 1];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"第%d个副标题", (int)indexPath.row + 1];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
