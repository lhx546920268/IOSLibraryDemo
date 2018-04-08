//
//  CollectionReusableView.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/2/5.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "CollectionReusableView.h"

@implementation CollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.clipsToBounds = NO;
}

@end
