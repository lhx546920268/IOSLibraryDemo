//
//  CollectionViewSkeletonViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2019/7/8.
//  Copyright © 2019 罗海雄. All rights reserved.
//

#import "CollectionViewSkeletonViewController.h"
#import "CollectionViewSkeletonCell.h"
#import "CollectionViewSkeletonHeader.h"
#import <UIView+SeaSkeleton.h>

@interface CollectionViewSkeletonViewController ()

@property(nonatomic, strong) NSArray *datas;

@end

@implementation CollectionViewSkeletonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"UICollectionView";
    
    NSMutableArray *datas = [NSMutableArray array];
    for(NSInteger i = 0;i < 30;i ++){
        [datas addObject:@(i)];
    }
    
    self.datas = datas;
    [self initialization];
    
    WeakSelf(self)
    [self.collectionView sea_showSkeletonWithDuration:2.0 completion:^{
        [weakSelf.collectionView sea_hideSkeletonWithAnimate:YES];
    }];
}

- (void)initialization
{
    CGFloat size = (UIScreen.screenWidth - 10 * 4) / 3;
    self.flowLayout.itemSize = CGSizeMake(size, size + 30);
    self.flowLayout.minimumLineSpacing = 10;
    self.flowLayout.minimumInteritemSpacing = 10;
    self.flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.flowLayout.headerReferenceSize = CGSizeMake(UIScreen.screenWidth, 40);
    
    [self registerClass:CollectionViewSkeletonCell.class];
    [self registerHeaderNib:CollectionViewSkeletonHeader.class];
    self.collectionView.backgroundColor = SeaGrayBackgroundColor;
    
    [super initialization];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewSkeletonCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewSkeletonCell.sea_nameOfClass forIndexPath:indexPath];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewSkeletonHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:CollectionViewSkeletonHeader.sea_nameOfClass forIndexPath:indexPath];
    
    return header;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}


@end
