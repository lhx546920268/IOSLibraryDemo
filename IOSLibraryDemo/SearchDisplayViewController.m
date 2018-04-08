//
//  SearchDisplayViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/22.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "SearchDisplayViewController.h"
#import <SeaSearchBar.h>

@interface SearchDisplayViewController ()<UITableViewDelegate,UITableViewDataSource, SeaSearchBarDelegate>


@property(nonatomic, strong) SeaSearchBar *searchBar;

@end

@implementation SearchDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"搜索";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self registerClass:[UITableViewCell class]];
    [self initialization];
    
    self.tableView.clipsToBounds = NO;
    
    SeaSearchBar *searchBar = [[SeaSearchBar alloc] initWithFrame:CGRectMake(0, 0, SeaScreenWidth, 45)];
    searchBar.placeholder = @"搜索一个查哈";
    searchBar.icon = [UIImage imageNamed:@"icon"];
    searchBar.delegate = self;
    searchBar.iconPosition = SeaSearchBarIconPositionLeft;
    self.tableView.tableHeaderView = searchBar;
//    self.topView = searchBar;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    if(!self.searchBar){
//
//        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 50)];
//        textField.placeholder = @"搜索";
//        textField.returnKeyType = UIReturnKeySearch;
//        textField.enablesReturnKeyAutomatically = YES;
//
//        [self.view addSubview:textField];
//
//        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//        tableView.delegate = self;
//        tableView.dataSource = self;
//        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
//        if (@available(iOS 11.0, *)) {
//            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        } else {
//            // Fallback on earlier versions
//        }
//        self.tableView = tableView;
//        [self.tableView setExtraCellLineHidden];
//        [self.view addSubview:tableView];
////
//        [self.tableView sea_insets:UIEdgeInsetsZero inItem:self];
////
////        SeaSearchBar *bar = [[SeaSearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 45)];
////        bar.placeholder = @"搜索";
////        bar.icon = [UIImage imageNamed:@"icon"];
////        [self.view addSubview:bar];
////
//
//        SeaSearchBar *searchBar = [[SeaSearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 45)];
//        searchBar.placeholder = @"搜索一个查哈";
//        searchBar.icon = [UIImage imageNamed:@"icon"];
//        searchBar.delegate = self;
//        searchBar.iconPosition = SeaSearchBarIconPositionLeft;
//        self.tableView.tableHeaderView = searchBar;
////        [self.view addSubview:searchBar];
//
////        [searchBar sea_leftToItem:self];
////        [searchBar sea_rightToItem:self];
////        [searchBar sea_topToItem:self];
//
////        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
////        [self.view addConstraint:constraint];
//
//        NSLog(@"%f,%f", SeaScreenWidth, SeaScreenHeight);
//        self.searchBar = searchBar;
    }
}

- (void)searchBarDidBeginEditing:(SeaSearchBar *)searchBar
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [searchBar setShowsCancelButton:YES animated:YES];
    [searchBar setShowsAttachedContent:YES animated:YES];
}

- (void)searchBarDidEndEditing:(SeaSearchBar *)searchBar
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar setShowsAttachedContent:NO animated:YES];
}

//- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar
//{
//    NSLog(@"positionForBar");
//    return UIBarPositionTopAttached;
//}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
