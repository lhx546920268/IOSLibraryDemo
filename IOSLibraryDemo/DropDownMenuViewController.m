//
//  DropDownMenuViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/12.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "DropDownMenuViewController.h"
#import <SeaDropDownMenu.h>

@interface DropDownMenuViewController ()

@end

@implementation DropDownMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = NSStringFromClass([SeaDropDownMenu class]);
    
    NSMutableArray *items = [NSMutableArray array];
    SeaDropDownMenuItem *item = [SeaDropDownMenuItem new];
    item.titleLists = @[@"默认", @"价格从上到下从左到右", @"销量", @"收藏"];
    item.iconPosition = SeaDropDownMenuIconPositionLeft;
    [items addObject:item];
    
    item = [SeaDropDownMenuItem new];
    item.titleLists = @[@"分类", @"大吉"];
    [items addObject:item];
    
    SeaDropDownMenu *menu = [[SeaDropDownMenu alloc] initWithItems:items];
    menu.shouldShowIndicator = YES;
    [self setTopView:menu height:SeaDropDownMenuHeight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
