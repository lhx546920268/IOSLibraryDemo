//
//  NestedTableViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/4/12.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "NestedTableViewController.h"
#import "PageViewController.h"


@interface SubPageCell : UITableViewCell

///要显示的viewController
@property(nonatomic, strong) UIViewController *viewController;

///父
@property(nonatomic, weak) UIViewController *parentViewController;

@end

@interface NestedTableViewController ()

@property(nonatomic, strong) PageViewController *page;

@property(nonatomic, assign) CGFloat offset;

@end

@implementation NestedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = [PageViewController new];
    self.page.nestedTableViewController = self;
   
    [self initialization];
}

- (void)initialization
{
    [self registerClass:[UITableViewCell class]];
    [self registerClassForHeaderFooterView:[UITableViewHeaderFooterView class]];
    [self registerClass:[SubPageCell class]];

    [super initialization];
}

- (void)emptyViewWillAppear:(SeaEmptyView *)view
{
    if(![NSString isEmpty:self.title]){
        view.textLabel.text = [NSString stringWithFormat:@"暂无%@信息", self.title];
    }else{
        view.textLabel.text = @"暂无信息";
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    BOOL isParent = scrollView == self.tableView;
    CGPoint contentOffset = self.tableView.contentOffset;
    CGFloat maxOffsetY = self.tableView.contentSize.height - self.tableView.height;
    CGFloat offset = contentOffset.y - maxOffsetY;
    if(isParent){
        if(offset > 0){
            self.page.currentScrollView.contentOffset = CGPointMake(0, offset);
            self.tableView.contentOffset = CGPointMake(0, maxOffsetY);
        }
    }else{
        if(offset < 0){
            self.tableView.contentOffset = CGPointMake(0, contentOffset.y + scrollView.contentOffset.y);
            scrollView.contentOffset = CGPointZero;
        }else if(scrollView.contentOffset.y <= 0){
            self.tableView.contentOffset = CGPointMake(0, contentOffset.y + scrollView.contentOffset.y);
            scrollView.contentOffset = CGPointZero;
        }
        
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    BOOL isParent = scrollView == self.tableView;
    CGPoint contentOffset = self.tableView.contentOffset;
    CGFloat maxOffsetY = self.tableView.contentSize.height - self.tableView.height;
    CGFloat offset = contentOffset.y - maxOffsetY;
//    NSLog(@"%f", maxOffsetY);

    //将要偏移的距离
    CGFloat duration = 0.3;
    CGFloat offsetY = velocity.y * duration * 1000;

    if(isParent){
//        offset += offsetY;
//        NSLog(@"%f", offsetY);
//        NSLog(@"%f", offset);
//        if(offset > 0){
//            self.offset = offset;
//            [self.tableView setContentOffset:CGPointMake(0, maxOffsetY) animated:YES];
//        }
    }else{
        if(scrollView.contentOffset.y <= 0 && velocity.y < 0){
            NSLog(@"%f", contentOffset.y);
            NSLog(@"%f", offsetY);
            [self.tableView setContentOffset:CGPointMake(0, MAX(contentOffset.y + offsetY, -50)) animated:YES];
            scrollView.contentOffset = CGPointZero;
        }
    }
}



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    BOOL isParent = scrollView == self.tableView;
    if(isParent && !decelerate){
        if(scrollView.contentOffset.y < 0){
            [scrollView setContentOffset:CGPointZero animated:YES];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    BOOL isParent = scrollView == self.tableView;
    if(isParent){
        if(scrollView.contentOffset.y < 0){
            [scrollView setContentOffset:CGPointZero animated:YES];
        }
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    BOOL isParent = scrollView == self.tableView;
    if(isParent){
        if(scrollView.contentOffset.y < 0){
            [scrollView setContentOffset:CGPointZero animated:YES];
        }
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 10 : 1;
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
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[UITableViewCell sea_nameOfClass] forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"第%ld个", indexPath.row];
        
        return cell;
    }else{
        SubPageCell *cell = [tableView dequeueReusableCellWithIdentifier:[SubPageCell sea_nameOfClass] forIndexPath:indexPath];
        cell.parentViewController = self;
        cell.viewController = self.page;
        
        return cell;
    }
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
