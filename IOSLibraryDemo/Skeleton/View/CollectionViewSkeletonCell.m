//
//  CollectionViewSkeletonCell.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2019/7/8.
//  Copyright © 2019 罗海雄. All rights reserved.
//

#import "CollectionViewSkeletonCell.h"
#import <UIView+SeaAutoLayout.h>
#import <UIScreen+Utils.h>

@implementation CollectionViewSkeletonCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat size = (UIScreen.screenWidth - 10 * 4) / 3;
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"test_1" ofType:@"jpg"]]];
        [self.contentView addSubview:imageView];
        
        [imageView sea_sizeToSelf:CGSizeMake(size - 10, size - 10)];
        [imageView sea_centerXInSuperview];
        [imageView sea_topToSuperview:5];
        
        UILabel *label = [UILabel new];
        label.text = @"标题";
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        
        [label sea_topToItemBottom:imageView margin:5];
        [label sea_leftToSuperview:5];
        [label sea_rightToSuperview:5];
        
        self.contentView.backgroundColor = UIColor.whiteColor;
    }
    return self;
}

@end
