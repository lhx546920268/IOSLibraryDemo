//
//  PolygonViewController.m
//  IOSLibraryDemo
//
//  Created by luohaixiong on 2018/8/28.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "PolygonViewController.h"

@interface PolygonView : UIView

///点
@property(nonatomic, strong) NSArray<NSValue*> *points;

///line
@property(nonatomic, strong) NSArray<NSValue*> *lines;

@end

@implementation PolygonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.opaque = NO;
    }
    
    return self;
}

- (void)setPoints:(NSArray<NSValue *> *)points
{
    _points = points;
    [self setNeedsDisplay];
}

- (void)setLines:(NSArray<NSValue *> *)lines
{
    _lines = lines;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if(self.points.count > 0){
        CGContextRef cx = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(cx, [UIColor redColor].CGColor);
        CGContextSetStrokeColorWithColor(cx, [UIColor cyanColor].CGColor);
        
        CGPoint point = [[self.points firstObject] CGPointValue];
        CGContextMoveToPoint(cx, point.x, point.y);
        for(NSInteger i = 1;i < self.points.count;i ++){
            CGPoint p = [self.points[i] CGPointValue];
            CGContextAddLineToPoint(cx, p.x, p.y);
        }
        
        CGContextAddLineToPoint(cx, point.x, point.y);
        CGContextDrawPath(cx, kCGPathStroke);
        
        if(self.lines.count > 0){
            CGContextSetStrokeColorWithColor(cx, [UIColor blackColor].CGColor);
            point = [[self.lines firstObject] CGPointValue];
            CGContextMoveToPoint(cx, point.x, point.y);
            point = [[self.lines lastObject] CGPointValue];
            CGContextAddLineToPoint(cx, point.x, point.y);
            CGContextDrawPath(cx, kCGPathStroke);
        }
    }
    
}

@end

@interface PolygonViewController ()

@property(nonatomic, weak) PolygonView *polygon;

@end

@implementation PolygonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PolygonView *view = [PolygonView new];
    view.points = @[
                    [NSValue valueWithCGPoint:CGPointMake(30, 35)],
                    [NSValue valueWithCGPoint:CGPointMake(200, 30)],
                    
                    [NSValue valueWithCGPoint:CGPointMake(180, 70)],
                    [NSValue valueWithCGPoint:CGPointMake(130, 120)],
                    [NSValue valueWithCGPoint:CGPointMake(100, 60)],
                    ];
    [self.view addSubview:view];
    [view sea_insetsInSuperview:UIEdgeInsetsZero];
    self.polygon = view;
    [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTap:(UITapGestureRecognizer*) tap
{
    CGPoint point = [tap locationInView:tap.view];
    if(polygonContainsPoint(self.polygon.points, point)){
        [self sea_alertMsg:[NSString stringWithFormat:@"包含(%f, %f)", point.x, point.y]];
    }
}

@end
