//
//  NestedTableViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/4/12.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "NestedTableViewController.h"
#import "PageViewController.h"
#import "CustomTableView.h"
#import "NestedTableViewCell.h"

@interface SubPageCell : UITableViewCell

///要显示的viewController
@property(nonatomic, strong) UIViewController *viewController;

///父
@property(nonatomic, weak) UIViewController *parentViewController;



@end

@interface NestedTableViewController ()

@property(nonatomic, strong) PageViewController *page;

///父scrollView 是否可以滑动
@property(nonatomic,assign) BOOL parentScrollEnable;

///子scrollView 是否可以滑动
@property(nonatomic,assign) BOOL childScrollEnable;

@end

@implementation NestedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = [PageViewController new];
    self.page.nestedTableViewController = self;
    
    self.parentScrollEnable = YES;
    self.childScrollEnable = YES;
//    self.tableView.bounces = NO;
   
    [self initialization];
}

- (void)initialization
{
    [self registerNib:[NestedTableViewCell class]];
    [self registerClassForHeaderFooterView:[UITableViewHeaderFooterView class]];
    [self registerClass:[SubPageCell class]];
    
    [super initialization];
    
    CustomTableView *tableView = (CustomTableView*)self.tableView;
    
    
    WeakSelf(self);
    tableView.hitTestHandler = ^(UIView *view){
        UIView *scrollView = weakSelf.page.currentScrollView;
        if(![view isDescendantOfView:scrollView]){
            return view;
        }else{
            
            return scrollView;
        }
    };
}

- (Class)tableViewClass
{
    return self.isContainer ? [CustomTableView class] : [super tableViewClass];
}

- (void)emptyViewWillAppear:(SeaEmptyView *)view
{
    if(![NSString isEmpty:self.title]){
        view.textLabel.text = [NSString stringWithFormat:@"暂无%@信息", self.title];
    }else{
        view.textLabel.text = @"暂无信息";
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.page.scrollView.scrollEnabled = NO;
    CustomTableView *tableView = (CustomTableView*)self.tableView;
    tableView.scrollView = self.page.scrollView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    BOOL isParent = scrollView == self.tableView;
    CGPoint contentOffset = scrollView.contentOffset;
    
    if(isParent){
        
        //下拉刷新中
        if(self.page.currentScrollView.contentOffset.y < 0){
            scrollView.contentOffset = CGPointZero;
            return;
        }
        
        CGFloat maxOffsetY = scrollView.contentSize.height - scrollView.height;
        CGFloat offset = contentOffset.y - maxOffsetY;
        
        //已经滑出顶部范围了，让子容器滑动
        if(offset >= 0){
            scrollView.contentOffset = CGPointMake(0, maxOffsetY);
            if(self.parentScrollEnable){
                self.parentScrollEnable = NO;
                self.childScrollEnable = YES;
            }
        }else{
            //不能让父容器继续滑动了
            if(!self.parentScrollEnable){
                scrollView.contentOffset = CGPointMake(0, maxOffsetY);
            }
        }
        
        //到顶部了，应该要下拉刷新了
        if(scrollView.contentOffset.y == 0){
            self.childScrollEnable = YES;
        }
    }else{
        
        //滚动容器还在滑动中
        CGFloat maxOffsetY = self.tableView.contentSize.height - self.tableView.height;
        if(!self.childScrollEnable || (self.tableView.contentOffset.y > 0 && self.tableView.contentOffset.y < maxOffsetY)){
            scrollView.contentOffset = CGPointZero;
            return;
        }
        
        //滑到滚动容器了滚动容器
        if(contentOffset.y <= 0){
            scrollView.contentOffset = CGPointZero;
            if(self.tableView.contentOffset.y > 0){
                self.childScrollEnable = NO;
                self.parentScrollEnable = YES;
            }
        }
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    self.page.scrollView.scrollEnabled = YES;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 3 : 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 0 ? 45 : tableView.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? 50 : CGFLOAT_MIN;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[UITableViewHeaderFooterView sea_nameOfClass]];
        
        header.textLabel.text = @"悬浮";
        
        return header;
    }
    return nil;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        NestedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NestedTableViewCell sea_nameOfClass] forIndexPath:indexPath];
        
        [cell.btn setTitle:[NSString stringWithFormat:@"第%ld个按钮", indexPath.row] forState:UIControlStateNormal];
        cell.contentView.tag = indexPath.row + 1;
        
        return cell;
    }else{
        SubPageCell *cell = [tableView dequeueReusableCellWithIdentifier:[SubPageCell sea_nameOfClass] forIndexPath:indexPath];
        cell.parentViewController = self;
        cell.viewController = self.page;
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end

@implementation SubPageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

- (void)setViewController:(UIViewController *)viewController
{
    if(_viewController != viewController){
        if(_viewController){
            [_viewController removeFromParentViewController];
            [_viewController.view removeFromSuperview];
        }
        
        _viewController = viewController;
        [_viewController willMoveToParentViewController:self.parentViewController];
        [self.contentView addSubview:_viewController.view];
        [_viewController.view sea_insetsInSuperview:UIEdgeInsetsZero];
        [_viewController didMoveToParentViewController:self.parentViewController];
    }
}

@end
