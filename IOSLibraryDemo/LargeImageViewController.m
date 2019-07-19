//
//  LargeImageViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/3/2.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "LargeImageViewController.h"
#import <SeaTiledImageView.h>
#import <SeaAlertController.h>

@interface LargeImageViewController ()<UIScrollViewDelegate>

@property(nonatomic, strong) SeaTiledImageView *imageView;

@end

@implementation LargeImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"长图、大图";
    
    // Do any additional setup after loading the view.
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.minimumZoomScale = 1;
    scrollView.maximumZoomScale = 5;
    scrollView.bouncesZoom = YES;
    scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    [scrollView sea_insetsInSuperview:UIEdgeInsetsZero];
    
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"xx" ofType:@"png"]];
    CGSize size = [image sea_fitWithSize:CGSizeMake(UIScreen.screenWidth, 0) type:SeaImageFitTypeWidth];
    SeaTiledImageView *imageView = [[SeaTiledImageView alloc] initWithFrame:CGRectMake((UIScreen.screenWidth - size.width) / 2, 0, size.width, size.height)];
    imageView.image = image;
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)]];
    [scrollView addSubview:imageView];
    self.imageView = imageView;
    
    scrollView.contentSize = size;
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat x = (self.view.bounds.size.width - _imageView.frame.size.width) / 2;
    x = x < 0 ? 0 : x;
    CGFloat y = (self.view.bounds.size.height - _imageView.frame.size.height) / 2;
    y = y < 0 ? 0 : y;
    
    _imageView.center = CGPointMake(x + _imageView.frame.size.width / 2.0, y + _imageView.frame.size.height / 2.0);
}

- (void)handleLongPress:(UILongPressGestureRecognizer*) longPress
{
    if(longPress.state == UIGestureRecognizerStateBegan){
        SeaAlertController *alert = [SeaAlertController actionSheetWithTitle:@"是否保存图片到相册" message:nil otherButtonTitles:@[@"保存"]];
        alert.selectionHandler = ^(NSUInteger index) {
            [self saveImage];
        };
        
        [alert show];
    }
}

///保存图片
- (void)saveImage
{
    self.sea_showNetworkActivity = YES;
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    self.sea_showNetworkActivity = NO;
    [self sea_alertMsg:@"保存成功"];
}

@end
