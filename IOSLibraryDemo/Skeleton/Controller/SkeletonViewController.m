//
//  SkeletonViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2019/7/4.
//  Copyright © 2019 罗海雄. All rights reserved.
//

#import "SkeletonViewController.h"
#import "NormalSkeletonViewController.h"
#import "TableViewSkeletonViewController.h"
#import "CollectionViewSkeletonViewController.h"

@interface SkeletonViewController ()

@property(nonatomic, strong) NSArray *datas;

@end

@implementation SkeletonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"骨架";
    self.datas = @[@"普通视图", @"TableView", @"CollectionView"];
    
    [self initialization];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = self.datas[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0 :
            [self.navigationController pushViewController:[NormalSkeletonViewController new] animated:YES];
            break;
        case 1 :
            [self.navigationController pushViewController:[TableViewSkeletonViewController new] animated:YES];
            break;
        case 2 :
            [self.navigationController pushViewController:[CollectionViewSkeletonViewController new] animated:YES];
            break;
        default:
            break;
    }
}

@end
