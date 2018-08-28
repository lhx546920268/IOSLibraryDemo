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
#import "HitTestViewController.h"
#import <SeaToast.h>
#import <malloc/malloc.h>
#import <objc/runtime.h>
#import "RefreshViewController.h"
#import "PolygonViewController.h"

@interface RootViewController ()<UIDocumentPickerDelegate, UIDocumentInteractionControllerDelegate>

@property(nonatomic, strong) NSArray<NSString*> *titles;

@property(nonatomic, strong) SeaPopoverMenu *popoverMenu;

@property(nonatomic, strong) NSMutableArray *images;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"首页";
    self.images = [NSMutableArray array];
    
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
                    @"嵌套scrollView",
                    @"hit test 测试",
                    @"刷新",
                    @"多边形"];
    
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
        menu.arrowSize = CGSizeMake(15, 10);
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
            [dialogVC showAsDialog];
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
//            [SeaToastStyle sharedInstance].offset = 30;
//            UIImage *image = [UIImage imageNamed:@"icon"];
            UIImage *image12x = [UIImage sea_bundleImageWithName:@"1@2x"];
            [self.images addObject:image12x];
            UIImage *image1 = [UIImage sea_bundleImageWithName:@"xx"];
            [self.images addObject:image1];
            NSLog(@"size = %zd", malloc_size((__bridge const void *)image1));
            NSLog(@"size = %zd", malloc_good_size(class_getInstanceSize([image1 class])));
            UIImage *image2 = [UIImage sea_bundleImageWithName:@"2@2x"];
            [self.images addObject:image2];
//            UIImage *image3 = [UIImage sea_bundleImageWithName:@"3"];
            UIImage *image4 = [UIImage sea_bundleImageWithName:@"4"];
            [self.images addObject:image4];
            UIImage *image5 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"5" ofType:@"jpg"]];
            
            NSLog(@"size = %zd", malloc_size((__bridge const void *)image5));
            NSLog(@"size = %zd", malloc_good_size(class_getInstanceSize([image5 class])));
            [self.images addObject:image5];
//            NSString *str = @"这是一个小提示框";
//            [self sea_alertMsg:str icon:image];
        }
            break;
        case 11 : {
            [self sea_pushViewControllerUseTransitionDelegate:[WebViewJSViewController new]];
        }
            break;
        case 12 : {
            SeaAlertStyle *style = [SeaAlertStyle actionSheetInstance];
            style.buttonTextColor = [UIColor blackColor];
            style.cornerRadius = 0;
            style.contentInsets = UIEdgeInsetsMake(10, 0, 0, 0);
            style.cancelButtonVerticalSpacing = 8;
            style.spacingBackgroundColor = [UIColor colorWithWhite:1.0 alpha:0.9];
            
            NSMutableArray *actions = [NSMutableArray array];
            [actions addObject:[SeaAlertAction alertActionWithTitle:@"相册" icon:[UIImage imageNamed:@"icon"]]];
            [actions addObject:[SeaAlertAction alertActionWithTitle:@"拍照" icon:[UIImage imageNamed:@"icon"]]];
            
            SeaAlertController *alert = [[SeaAlertController alloc] initWithTitle:nil message:nil icon:nil style:SeaAlertControllerStyleActionSheet cancelButtonTitle:@"取消" otherButtonActions:actions];
            
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
            
            SeaAlertStyle *style = [SeaAlertStyle alertInstance];
            style.destructiveButtonTextColor = [UIColor whiteColor];
            style.destructiveButtonBackgroundColor = [UIColor redColor];
            
            SeaAlertController *alert = [[SeaAlertController alloc] initWithTitle:@"Alert标题" message:@"Alert信息" icon:[UIImage imageNamed:@"icon"] style:SeaAlertControllerStyleAlert cancelButtonTitle:nil otherButtonTitles:@[@"相册", @"拍照"]];
            
            alert.destructiveButtonIndex = 1;
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
        case 18 : {
            [self sea_pushViewControllerUseTransitionDelegate:[HitTestViewController new]];
        }
            break;
        case 19 : {
            [self sea_pushViewControllerUseTransitionDelegate:[RefreshViewController new]];
        }
            break;
        case 20 : {
            [self sea_pushViewControllerUseTransitionDelegate:[PolygonViewController new]];
        }
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
