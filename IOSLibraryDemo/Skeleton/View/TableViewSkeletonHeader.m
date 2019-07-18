//
//  TableViewSkeletonHeader.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2019/7/8.
//  Copyright © 2019 罗海雄. All rights reserved.
//

#import "TableViewSkeletonHeader.h"
#import <UIView+SeaAutoLayout.h>

@implementation TableViewSkeletonHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if(self){
        
        self.contentView.backgroundColor = UIColor.whiteColor;
        _titleLabel = [UILabel new];
        _titleLabel.text = @"这是一个标题";
        [self.contentView addSubview:_titleLabel];
        
        [_titleLabel sea_leftToSuperview: 15];
        [_titleLabel sea_centerYInSuperview];
    }
    
    return self;
}

@end
