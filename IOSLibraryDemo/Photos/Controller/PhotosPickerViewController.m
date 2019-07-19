//
//  PhotosPickerViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2019/7/19.
//  Copyright © 2019 罗海雄. All rights reserved.
//

#import "PhotosPickerViewController.h"
#import "SeaPhotosViewController.h"
#import "PhotosPickerCollectionViewCell.h"
#import "SeaImageBrowseViewController.h"

@interface PhotosPickerViewController ()

@property(nonatomic, strong) NSMutableArray<SeaPhotosPickResult*> *results;

@property(nonatomic, assign) NSInteger maxCount;

@end

@implementation PhotosPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.maxCount = 9;
    self.results = [NSMutableArray array];
    self.navigationItem.title = @"相册";
    [self initialization];
}

- (void)initialization
{
    self.flowLayout.minimumLineSpacing = 5;
    self.flowLayout.minimumLineSpacing = 5;
    self.flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
    CGFloat size = floor((UIScreen.screenWidth - 15 * 2 - 5 * 2) / 3);
    self.flowLayout.itemSize = CGSizeMake(size, size);
    [self registerClass:PhotosPickerCollectionViewCell.class];
    [super initialization];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.results.count >= self.maxCount ? self.results.count : self.results.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotosPickerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotosPickerCollectionViewCell.sea_nameOfClass forIndexPath:indexPath];
    
    if(indexPath.item < self.results.count){
        cell.imageView.image = self.results[indexPath.item].thumbnail;
    }else{
        cell.imageView.image = [UIImage imageNamed:@"4"];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    if(indexPath.item < self.results.count){
        
        NSMutableArray *images = [NSMutableArray array];
        for(SeaPhotosPickResult *result in self.results){
            [images addObject:result.compressedImage];
        }
        
        SeaImageBrowseViewController *controller = [[SeaImageBrowseViewController alloc] initWithImages:images visibleIndex:indexPath.item];
        
        controller.animatedViewHandler = ^UIView*(NSUInteger index){
            
            PhotosPickerCollectionViewCell *cell = (PhotosPickerCollectionViewCell*)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
            
            return cell;
        };
        
        [controller showAnimate:YES];
        
    }else{
        SeaPhotosViewController *album = [SeaPhotosViewController new];
        album.photosOptions.maxCount = self.maxCount - self.results.count;
        album.photosOptions.thumbnailSize = self.flowLayout.itemSize;
        album.photosOptions.intention = SeaPhotosIntentionMultiSelection;
        album.photosOptions.needOriginalImage = YES;
        
        WeakSelf(self)
        album.photosOptions.completion = ^(NSArray<SeaPhotosPickResult *> *results) {
            [weakSelf.results addObjectsFromArray:results];
            [weakSelf.collectionView reloadData];
        };
        
        [self presentViewController:[album sea_createWithNavigationController] animated:YES completion:nil];
    }
    
    
}

@end
