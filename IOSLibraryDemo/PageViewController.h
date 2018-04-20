//
//  PageViewController.h
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/11.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import <IOSLibrary/IOSLibrary.h>
#import "NestedTableViewController.h"


@interface PageViewController : SeaPageViewController

@property(nonatomic, weak) NestedTableViewController *nestedTableViewController;

@property(nonatomic, readonly) UIScrollView *currentScrollView;

@end
