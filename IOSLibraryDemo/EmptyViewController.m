//
//  EmptyViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/4/9.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "EmptyViewController.h"

@interface EmptyViewController ()

@property(nonatomic, assign) int count;

@end

@implementation EmptyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    [self setBottomView:view height:40];
    
    view = [UIView new];
    view.backgroundColor = [UIColor cyanColor];
    [self setTopView:view height:40];

    self.sea_showFailPage = YES;
//    self.count = 3;
//    self.view.sea_emptyViewDelegate = self;
//    self.view.sea_showEmptyView = YES;
//    [self initialization];
}

- (void)sea_reloadData
{
    self.sea_showPageLoading = YES;
}

- (void)initialization
{
    [self registerClass:[UITableViewCell class]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sea_shouldShowEmptyView = YES;
    [self.tableView.sea_emptyView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)]];
    
    [super initialization];
}

- (void)handleTap:(UITapGestureRecognizer*) tap
{
    self.count = 3;
    [self.tableView reloadData];
}

- (void)emptyViewWillAppear:(SeaEmptyView *)view
{
    view.textLabel.text = @"没有数据";
    view.iconImageView.image = [UIImage imageNamed:@"icon"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCell.sea_nameOfClass forIndexPath:indexPath];
    
    cell.textLabel.text = @"空视图";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.count = 0;
    [tableView reloadData];
}

@end
