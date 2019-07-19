//
//  PhotosPickerCollectionViewCell.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2019/7/19.
//  Copyright © 2019 罗海雄. All rights reserved.
//

#import "PhotosPickerCollectionViewCell.h"
#import <UIView+SeaAutoLayout.h>

@implementation PhotosPickerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
        _imageView = [UIImageView new];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        _imageView.clipsToBounds = YES;
        [self addSubview:_imageView];
        
        [_imageView sea_insetsInSuperview:UIEdgeInsetsZero];
    }
    
    return self;
}

@end
