//
//  FillLayoutViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/31.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "FillLayoutViewController.h"
#import <SeaCollectionViewFlowFillLayout.h>
#import "CollectionReusableView.h"

@interface FillLayoutViewController ()<SeaCollectionViewFlowFillLayoutDelegate>

@property(nonatomic, strong) NSMutableSet *set;

@end

@implementation FillLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"SeaCollectionViewFlowFillLayout";
    
    self.set = [NSMutableSet set];
    SeaCollectionViewFlowFillLayout *layout = [SeaCollectionViewFlowFillLayout new];
    
    self.layout = layout;
    
    [self registerClass:[UICollectionViewCell class]];
    [self registerHeaderNib:CollectionReusableView.class];
    
    self.collectionView.backgroundColor = SeaGrayBackgroundColor;
    [self initialization];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 100;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)collectionViewLayout;
    return CGSizeMake((layout.collectionView.width - layout.minimumLineSpacing * 2) / 3, (layout.collectionView.width - layout.minimumLineSpacing * 2) / 3);
}

- (CGSize)collectionViewFlowFillLayout:(SeaCollectionViewFlowFillLayout *)layout itemSizeForIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((layout.collectionView.width - layout.minimumLineSpacing * 2) / 3, (layout.collectionView.width - layout.minimumLineSpacing * 2) / 3);
}

- (BOOL)collectionViewFlowFillLayout:(SeaCollectionViewFlowFillLayout *)layout shouldStickHeaderAtSection:(NSInteger)section
{
    return YES;
}

- (CGFloat)collectionViewFlowFillLayout:(SeaCollectionViewFlowFillLayout *)layout headerHeightAtSection:(NSInteger)section
{
    return 45;
}

- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        
        CollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([CollectionReusableView class]) forIndexPath:indexPath];
        
        header.backgroundColor = indexPath.section % 2 == 0 ? [UIColor redColor] : [UIColor greenColor];
        
        return header;
    }
    
    return nil;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor cyanColor];
    

    return cell;
}

@end
