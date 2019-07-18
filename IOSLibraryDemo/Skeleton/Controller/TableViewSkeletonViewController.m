//
//  TableViewSkeletonViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2019/7/4.
//  Copyright © 2019 罗海雄. All rights reserved.
//

#import "TableViewSkeletonViewController.h"
#import "TableViewSkeletonCell.h"
#import <UIView+SeaSkeleton.h>
#import "TableViewSkeletonHeader.h"

@interface TableViewSkeletonViewController ()

@property(nonatomic, strong) NSArray *datas;

@end

@implementation TableViewSkeletonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"TableView";
    NSMutableArray *datas = [NSMutableArray array];
    for(NSInteger i = 0;i < 10;i ++){
        [datas addObject:@(i)];
    }
    
    self.datas = datas;
    [self initialization];
}

- (void)initialization
{
    self.style = UITableViewStyleGrouped;
    [self registerNib:TableViewSkeletonCell.class];
    [self registerClassForHeaderFooterView:TableViewSkeletonHeader.class];
    self.tableView.rowHeight = 80;
    
    [super initialization];
    
    [self.tableView sea_showSkeleton];
    
    [self performSelector:@selector(hideSkeleton) withObject:nil afterDelay:2.0];
}


- (void)dealloc
{
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideSkeleton) object:nil];
}

- (void)hideSkeleton
{
    [self.tableView sea_hideSkeletonWithAnimate:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TableViewSkeletonHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:TableViewSkeletonHeader.sea_nameOfClass];
    
    header.titleLabel.text = @"这是第一个section header";
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    TableViewSkeletonHeader *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:TableViewSkeletonHeader.sea_nameOfClass];
    
    footer.titleLabel.text = @"这是第一个section footer";
    
    return footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewSkeletonCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewSkeletonCell.sea_nameOfClass forIndexPath:indexPath];
    
    return cell;
}

//- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return NO;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
