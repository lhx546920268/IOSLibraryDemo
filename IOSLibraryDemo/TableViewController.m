//
//  TableViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/23.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Vertical";
    [self registerClass:[UITableViewCell class]];
    [self initialization];
    if(self.presentingViewController){
        [self sea_setRightItemWithTitle:@"取消" action:@selector(cancel)];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d", (int)indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UINavigationController *nav = [[TableViewController new] sea_createWithNavigationController];
    nav.view.height = 300;
    [SeaPartialPresentTransitionDelegate presentViewController:nav inViewController:self];
//    [self.navigationController pushViewController:[TableViewController new] animated:YES];
}

@end
