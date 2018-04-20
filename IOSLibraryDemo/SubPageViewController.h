//
//  SubPageViewController.h
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/11.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import <IOSLibrary.h>
#import "CustomTableView.h"
#import "PageViewController.h"

@interface SubPageViewController : SeaTableViewController

@property(nonatomic, weak) PageViewController *pageViewController;

@property (nonatomic, assign) NSInteger index;

@end
