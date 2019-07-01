//
//  CustomTableView.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/4/12.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "CustomTableView.h"

@interface CustomTableView()


@end

@implementation CustomTableView

///允许手势冲突
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    return CGPointEqualToPoint(CGPointZero, [self.panGestureRecognizer translationInView:self]) ? view : self.hitTestHandler(view);
}

@end
