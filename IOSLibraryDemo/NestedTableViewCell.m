//
//  NestedTableViewCell.m
//  IOSLibraryDemo
//
//  Created by luohaixiong on 2018/11/14.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "NestedTableViewCell.h"

@implementation NestedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)handleTouch:(id)sender {
    NSLog(@"点击了");
}
@end
