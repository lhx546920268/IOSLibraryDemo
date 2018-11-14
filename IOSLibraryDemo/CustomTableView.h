//
//  CustomTableView.h
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/4/12.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableView : UITableView<UIGestureRecognizerDelegate>

@property(nonatomic, copy) UIView* (^hitTestHandler)(UIView *superHandlerView);

@property(nonatomic, weak) UIScrollView *scrollView;

@end
