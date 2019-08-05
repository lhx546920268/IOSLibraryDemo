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
    layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    
    self.layout = layout;
    
    [self registerClass:[UICollectionViewCell class]];
    [self registerHeaderNib:CollectionReusableView.class];
    
    self.collectionView.backgroundColor = SeaGrayBackgroundColor;
    [self initialization];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (CGSize)collectionViewFlowFillLayout:(SeaCollectionViewFlowFillLayout *)layout itemSizeForIndexPath:(NSIndexPath *)indexPath
{
    CGFloat size = (layout.collectionView.width - layout.minimumLineSpacing * 2 - layout.sectionInset.left - layout.sectionInset.right) / 3;
    CGFloat margin = random() % 100;
    
    return CGSizeMake(size, size + margin);
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    NSLog(@"indexPath section = %ld, item = %ld", indexPath.section, indexPath.item);
}

@end
