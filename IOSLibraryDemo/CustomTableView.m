//
//  CustomTableView.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/4/12.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "CustomTableView.h"

@interface CustomTableView()

///第一个位置
@property(nonatomic, assign) CGPoint firstPoint;

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
    return [view isKindOfClass:[UIButton class]] ? view : self.hitTestHandler(view);
//    if(self.hitTestHandler){
//        if(CGPointEqualToPoint(self.firstPoint, CGPointZero)){
//            self.firstPoint = point;
//        }else{
//            if(!CGPointEqualToPoint(self.firstPoint, point)){
//                self.firstPoint = CGPointZero;
//
//            }
//        }
//    }
//
//    return [super hitTest:point withEvent:event];
}

@end
