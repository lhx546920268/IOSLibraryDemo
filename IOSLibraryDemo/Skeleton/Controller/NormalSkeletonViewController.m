//
//  NormalSkeletonViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2019/7/4.
//  Copyright © 2019 罗海雄. All rights reserved.
//

#import "NormalSkeletonViewController.h"
#import <UIView+SeaSkeleton.h>

@interface NormalSkeletonViewController ()

@end

@implementation NormalSkeletonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"普通骨架";
    self.imageView.layer.cornerRadius = 50;
    self.imageView.layer.masksToBounds = YES;
    
    WeakSelf(self)
    [self.view sea_showSkeletonWithDuration:0.5 completion:^{
        [weakSelf hideSkeleton];
    }];
}


- (void)hideSkeleton
{
    [self.view sea_hideSkeletonWithAnimate:YES completion:nil];
}

@end
