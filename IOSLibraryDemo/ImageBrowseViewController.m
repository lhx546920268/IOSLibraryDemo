//
//  ImageBrowseViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/18.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "ImageBrowseViewController.h"
#import <SeaImageBrowseViewController.h>


@interface ImageView : UIImageView

@end

@implementation ImageView

+ (Class)layerClass
{
    return [CATiledLayer class];
}

@end

@interface ImageCell : UICollectionViewCell

@property(nonatomic, readonly) UIImageView *imageView;

@end

@implementation ImageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        _imageView = [UIImageView new];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_imageView];
        [_imageView sea_insetsInSuperview:UIEdgeInsetsZero];
    }
    
    return self;
}

@end

@interface ImageBrowseViewController ()

@property(nonatomic, strong) NSArray<NSString*> *URLs;

@end

@implementation ImageBrowseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"图片放大预览";
    
    self.URLs = @[@"http://zj.qianseit.com/public/images/91/6b/44/2d2219e51195d2dfdf3739a975c4da1f977616a5.jpg?1503997079#w",
                  @"http://zj.qianseit.com/public/images/19/5d/20/de240154445b2c20e28ea270fe7ae9a569b14c04.jpg?1503997229#w",
                  @"http://zj.qianseit.com/public/images/44/fe/e9/6e04b6f9cada14c7d66c117a05a0479c8de49912.jpg?1503997422#w",
                  @"http://zj.qianseit.com/public/images/de/40/dc/0534051586b9032b28ec122db09ccf87abc8e1b0.jpg?1503997500#w",
                  @"http://zj.qianseit.com/wap_themes/default/images/widget_default/wap_index_banner2/1659d92a305f19177773390ffe4650fea8c.jpg",
                  @"http://zj.qianseit.com/wap_themes/default/images/widget_default/wap_index_banner2/c18e0435cbc5924fb0218ca6cf93ba8d7d3.jpg",
                  @"http://mpic.spriteapp.cn/x/640x400/ugc/2016/10/27/5811f8029afa7_1.jpg"];
    
    self.flowLayout.minimumLineSpacing = 5;
    self.flowLayout.minimumInteritemSpacing = 5;
    self.flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    [self registerClass:[ImageCell class]];
    
    self.collectionView.backgroundColor = SeaGrayBackgroundColor;
    
    [self initialization];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.URLs.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (collectionView.width - self.flowLayout.minimumLineSpacing * 4) / 3;
    
    return CGSizeMake(width, width);
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ImageCell class]) forIndexPath:indexPath];
    
    [cell.imageView sea_setImageWithURL:self.URLs[indexPath.item]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    SeaImageBrowseViewController *controller = [[SeaImageBrowseViewController alloc] initWithURLs:self.URLs visibleIndex:indexPath.item];
    
    controller.animatedViewHandler = ^UIView*(NSUInteger index){
        
        ImageCell *cell = (ImageCell*)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
        
        return cell;
    };
    
    [controller showAnimate:YES];
}

@end
