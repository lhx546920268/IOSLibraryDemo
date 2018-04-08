//
//  MenuBarViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/10.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "MenuBarViewController.h"
#import <SeaMenuBar.h>

@interface MenuBarViewController ()

@end

@implementation MenuBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([SeaMenuBar class]);
    
    NSArray *titles = @[@"按钮1", @"按钮2", @"按钮3", @"按钮4", @"按钮5", @"按钮6", @"按钮7", @"按钮8"];
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:titles.count];
    for(NSString *title in titles){
        SeaMenuItemInfo *info = [SeaMenuItemInfo infoWithTitle:title];
        info.icon = [UIImage imageNamed:@"icon"];
        info.iconPadding = 5;
        info.iconPosition = SeaButtonImagePositionLeft;
        
        [items addObject:info];
    }
    
    SeaMenuBar *menuBar = [[SeaMenuBar alloc] initWithItemInfos:items];
    menuBar.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
    menuBar.itemInterval = 10;
    
    [self setTopView:menuBar height:60];
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
