//
//  RootViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/10.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "RootViewController.h"
#import "MenuBarViewController.h"
#import "PageViewController.h"
#import "DropDownMenuViewController.h"
#import <SeaAlbumAssetsViewController.h>
#import "ImageBrowseViewController.h"
#import <SeaTabBarController.h>
#import "DialogViewController.h"
#import "SearchDisplayViewController.h"
#import "TransitionViewController.h"
#import <SeaPopoverMenu.h>
#import "FillLayoutViewController.h"
#import <SeaWebViewController.h>
#import "BannerViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "LargeImageViewController.h"
#import "WebViewJSViewController.h"
#import "EmptyViewController.h"
#import "NestedTableViewController.h"
#import "CustomTableView.h"

@interface RootViewController ()<UIDocumentPickerDelegate, UIDocumentInteractionControllerDelegate>

@property(nonatomic, strong) NSArray<NSString*> *titles;

@property(nonatomic, strong) SeaPopoverMenu *popoverMenu;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"首页";
    
    self.titles = @[@"SeaMenuBar",
                    @"SeaPageViewController",
                    @"SeaDropDownMenu",
                    @"相册",
                    @"图片放大预览",
                    @"弹窗",
                    @"搜索",
                    @"transition",
                    @"badgeValue",
                    @"SeaCollectionViewFlowFillLayout",
                    @"toast",
                    @"webView",
                    @"actionSheet",
                    @"alert",
                    @"banner",
                    @"大图，长图",
                    @"空视图",
                    @"嵌套scrollView"];
    
    [self registerClass:[UITableViewCell class]];
    [self initialization];
    
    [self sea_setRightItemWithTitle:@"弹窗" action:@selector(popover)];
}

- (void)emptyViewWillAppear:(SeaEmptyView *)view
{
    view.textLabel.text = @"没数据";
}

- (void)popover
{
    if(!self.popoverMenu){
        SeaPopoverMenu *menu = [SeaPopoverMenu new];
        menu.rowHeight = 45;
        menu.iconTitleInterval = 10;
        menu.menuItemInfos = @[
                               [SeaPopoverMenuItemInfo infoWithTitle:@"我的朋友" icon:[UIImage imageNamed:@"icon"]],
                               [SeaPopoverMenuItemInfo infoWithTitle:@"首页" icon:[UIImage imageNamed:@"icon"]],
                               [SeaPopoverMenuItemInfo infoWithTitle:@"发起群聊" icon:[UIImage imageNamed:@"icon"]],
                               [SeaPopoverMenuItemInfo infoWithTitle:@"扫一扫" icon:[UIImage imageNamed:@"icon"]]
                               ];
        self.popoverMenu = menu;
    }
                           
    if(self.popoverMenu.isShowing){
        [self.popoverMenu dismissAnimated:YES];
    }else{
        [self.popoverMenu showInView:self.sea_tabBarController.view relatedRect:CGRectMake(self.view.width - 55, 0, 45, self.sea_navigationBarHeight + self.sea_statusBarHeight) animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
//    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
//    NSLog(@"%@", NSStringFromCGPoint(velocity));
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    cell.textLabel.text = self.titles[indexPath.item];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0 :
            [self sea_pushViewControllerUseTransitionDelegate:[MenuBarViewController new]];
            break;
        case 1 :
            [self sea_pushViewControllerUseTransitionDelegate:[PageViewController new]];
            break;
        case 2 :
            [self sea_pushViewControllerUseTransitionDelegate:[DropDownMenuViewController new]];
            break;
        case 3 : {
            SeaAlbumAssetsViewController *album = [SeaAlbumAssetsViewController new];
            
            SeaImageCropSettings *settings = [SeaImageCropSettings new];
            settings.cropSize = CGSizeMake(SeaScreenWidth, SeaScreenWidth);
            album.settings = settings;
            
            [self presentViewController:[album sea_createWithNavigationController] animated:YES completion:nil];
        }
            break;
        case 4 : {
            [self sea_pushViewControllerUseTransitionDelegate:[ImageBrowseViewController new]];
        }
            break;
        case 5 : {
            
            DialogViewController *dialogVC = [DialogViewController new];
            [dialogVC show];
        }
            break;
        case 6 : {
            [self sea_pushViewControllerUseTransitionDelegate:[SearchDisplayViewController new]];
        }
            break;
        case 7 : {
            [self sea_pushViewControllerUseTransitionDelegate:[TransitionViewController new]];
        }
            break;
        case 8 : {
            [self.sea_tabBarController setBadgeValue:@"11" forIndex:0];
        }
            break;
        case 9 : {
            [self sea_pushViewControllerUseTransitionDelegate:[FillLayoutViewController new]];
        }
            break;
        case 10 : {
//            [self sea_alertMsg:@"这是一个小提示框"];
//            [self sea_alertMsg:nil icon:[UIImage imageNamed:@"icon"]];
            [self sea_alertMsg:@"这是一个小提示框" icon:[UIImage imageNamed:@"icon"]];
        }
            break;
        case 11 : {
            [self sea_pushViewControllerUseTransitionDelegate:[WebViewJSViewController new]];
        }
            break;
        case 12 : {
            SeaAlertController *alert = [[SeaAlertController alloc] initWithTitle:nil message:@"actionSheet信息" icon:[UIImage imageNamed:@"icon"] style:SeaAlertControllerStyleActionSheet cancelButtonTitle:@"取消" otherButtonTitles:@[@"相册", @"拍照"]];
            
            __weak SeaAlertController *weakAlert = alert;
            WeakSelf(self);
            alert.selectionHandler = ^(NSUInteger index){
                switch (index) {
                    case 0 :
                    case 1 :
                        [weakSelf sea_alertMsg:[weakAlert buttonTitleForIndex:index]];
                        break;
                        
                    default:
                        break;
                }
            };
            [alert show];
        }
            break;
        case 13 : {
            
            SeaAlertController *alert = [[SeaAlertController alloc] initWithTitle:@"Alert标题" message:@"Alert信息" icon:[UIImage imageNamed:@"icon"] style:SeaAlertControllerStyleAlert cancelButtonTitle:nil otherButtonTitles:@[@"相册", @"拍照"]];
            
            __weak SeaAlertController *weakAlert = alert;
            WeakSelf(self);
            alert.selectionHandler = ^(NSUInteger index){
                switch (index) {
                    case 0 :
                    case 1 :
                        [weakSelf sea_alertMsg:[weakAlert buttonTitleForIndex:index]];
                        break;
                        
                    default:
                        break;
                }
            };
            [alert show];
        }
            break;
        case 14 : {
//            UIDocumentPickerViewController *doc = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:@[(NSString*)kUTTypePDF, @"com.microsoft.word.doc", (NSString*)kUTTypePlainText] inMode:UIDocumentPickerModeImport];
//            doc.delegate = self;
//            doc.view.backgroundColor = [UIColor whiteColor];
//            [self presentViewController:doc animated:YES completion:nil];
           [self sea_pushViewControllerUseTransitionDelegate:[BannerViewController new]];
        }
            break;
        case 15 : {
            [self sea_pushViewControllerUseTransitionDelegate:[LargeImageViewController new]];
        }
            break;
        case 16 : {
            [self sea_pushViewControllerUseTransitionDelegate:[EmptyViewController new]];
        }
            break;
        case 17 : {
            [self sea_pushViewControllerUseTransitionDelegate:[NestedTableViewController new]];
        }
            break;
        default:
            break;
    }
}

#pragma mark- UIDocumentPickerViewController delegate

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url
{
    UIDocumentInteractionController *vc = [UIDocumentInteractionController interactionControllerWithURL:url];
    vc.delegate = self;
    [vc presentPreviewAnimated:YES];
    NSLog(@"%@", url);
}

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls
{
    
}

- (UIViewController*)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller
{
    return self;
}

//- (UIView*)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller
//{
//    return self.view;
//}

@end
