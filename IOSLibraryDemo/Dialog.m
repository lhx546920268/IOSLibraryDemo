//
//  Dialog.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/19.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "Dialog.h"
#import <UIView+Utils.h>

@implementation Dialog

- (instancetype)init
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([Dialog class]) owner:nil options:nil] lastObject];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
