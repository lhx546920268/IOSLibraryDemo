//
//  BannerViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/2/27.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "BannerViewController.h"
#import <SeaBannerView.h>
#import <UIView+SeaAutoLayout.h>

@interface BannerViewController ()<SeaBannerViewDelegate>

@property(nonatomic, strong) SeaBannerView *verticalBannerView;
@property(nonatomic, strong) SeaBannerView *horizonalBannerView;

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"banner";
    
    self.verticalBannerView = [[SeaBannerView alloc] initWithScrollDirection:UICollectionViewScrollDirectionVertical];
    self.verticalBannerView.delegate = self;
  //  self.verticalBannerView.enableAutoScroll = NO;
    [self.verticalBannerView registerClass:[UICollectionViewCell class]];
    
    [self.view addSubview:self.verticalBannerView];
    
    self.horizonalBannerView = [[SeaBannerView alloc] initWithScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.horizonalBannerView.delegate = self;
    self.horizonalBannerView.bothAlpha = 0.8;
    self.horizonalBannerView.widthRatio = 0.8;
    self.horizonalBannerView.bothScale = 0.5;
    self.horizonalBannerView.bothSpacing = 10;
    self.horizonalBannerView.showPageControl = YES;
    self.horizonalBannerView.pageControl.pageIndicatorTintColor = UIColor.grayColor;
    self.horizonalBannerView.enableAutoScroll = NO;
    [self.horizonalBannerView registerClass:[UICollectionViewCell class]];
    [self.view addSubview:self.horizonalBannerView];
    
    [self.verticalBannerView sea_leftToSuperview];
    [self.verticalBannerView sea_rightToSuperview];
    [self.verticalBannerView sea_topToSuperview];
    [self.verticalBannerView sea_heightToSelf:100];
    
    [self.horizonalBannerView sea_leftToSuperview];
    [self.horizonalBannerView sea_rightToSuperview];
    [self.horizonalBannerView sea_topToItemBottom:self.verticalBannerView margin:30];
    [self.horizonalBannerView sea_heightToSelf:100];
    
    
}

- (NSInteger)numberOfCellsInBannerView:(SeaBannerView *)bannerView
{
    return 5;
}

- (UICollectionViewCell*)bannerView:(SeaBannerView *)bannerView cellForIndexPath:(NSIndexPath *)indexPath atIndex:(NSInteger)index
{
    UICollectionViewCell *cell = [bannerView dequeueReusableCellWithClass:[UICollectionViewCell class] forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [self colorForIndex:index];
    
    return cell;
}

- (UIColor*)colorForIndex:(NSInteger) index
{
    switch (index) {
        case 0 :
            return [UIColor redColor];
            break;
        case 1 :
            return [UIColor orangeColor];
            break;
        case 2 :
            return [UIColor yellowColor];
            break;
            case 3 :
            return [UIColor greenColor];
            break;
            case 4 :
            return [UIColor cyanColor];
            break;
            case 5 :
            return [UIColor blueColor];
            break;
            case 6 :
            return [UIColor purpleColor];
            break;
        default:
            break;
    }
    
    return [UIColor whiteColor];
}

@end
