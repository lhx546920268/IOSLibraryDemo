//
//  TabBar3ViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/19.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "TabBar3ViewController.h"
#import <objc/runtime.h>

@interface CoderDemoConpoment : NSObject<NSCoding>

@property(nonatomic, copy) NSString *pStr;

@property(nonatomic, assign) NSInteger pInteger;

@property(nonatomic, assign) int pInt;

@end

@interface CoderDemoConpomentSub : CoderDemoConpoment

@property(nonatomic, copy) NSString *pSubStr;

@end



@implementation CoderDemoConpoment

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self){
        [self sea_initWithCoder:aDecoder];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [self sea_encodeWithCoder:aCoder];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"component str = %@, integer = %ld, int = %d", self.pStr, self.pInteger, self.pInt];
}

@end

@implementation CoderDemoConpomentSub



- (NSString*)description
{
    return [NSString stringWithFormat:@"componentSub str = %@, integer = %ld, int = %d, subStr = %@", self.pStr, self.pInteger, self.pInt, self.pSubStr];
}


@end

@interface CoderDemo : NSObject<NSCoding>

@property(nonatomic, readonly) NSString *pReadonly;

@property(nonatomic, copy) NSString *pStr;

@property(nonatomic, assign) NSInteger pInteger;

@property(nonatomic, assign) int pInt;

@property(nonatomic, assign) int64_t pInt32;

@property(nonatomic, assign) int64_t pInt64;

@property(nonatomic, assign) float pFloat;

@property(nonatomic, assign) double pDouble;

@property(nonatomic, assign) long pLong;

@property(nonatomic, assign) long long pLongLong;

@property(nonatomic, assign) short pShort;

@property(nonatomic, assign) Byte pByte;

@property(nonatomic, assign) BOOL pBOOL;

@property(nonatomic, assign) char pChart;

@property(nonatomic, strong) CoderDemoConpoment *conpoment;

@property(nonatomic, strong) CoderDemoConpoment *conpomentSub;

@end

@implementation CoderDemo

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self){
        [self sea_initWithCoder:aDecoder];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [self sea_encodeWithCoder:aCoder];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"str = %@, integer = %ld, int = %d", self.pStr, self.pInteger, self.pInt];
}

@end

@interface TabBar3ViewController ()

@end

@implementation TabBar3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    [self performSelector:@selector(run:) withObject:@"第一个参数" withObject:@"第二个参数"];

    CoderDemo *demo = [CoderDemo new];
    demo.pStr = @"demo";
    demo.pInteger = 100;
    demo.pInt = 10;
    
    CoderDemoConpoment *component = [CoderDemoConpoment new];
    component.pStr = @"CoderDemoConpoment";
    component.pInteger = 1000;
    component.pInt = 101;
    demo.conpoment = component;
    
    CoderDemoConpomentSub *componentSub = [CoderDemoConpomentSub new];
    componentSub.pStr = @"CoderDemoConpomentSub";
    componentSub.pInteger = 1001;
    componentSub.pInt = 102;
    componentSub.pSubStr = @"CoderDemoConpomentSubStr";
    demo.conpomentSub = componentSub;
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:demo];
    demo = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSLog(@"%@", demo);
}



void run(id self, SEL _cmd, NSString *time, NSString *count)
{
    NSLog(@"run %@, %@", time, count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if(sel == NSSelectorFromString(@"run:")){
        
        class_addMethod(self, sel, (IMP)run, "");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

@end
