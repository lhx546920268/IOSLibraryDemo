//
//  DialogViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/1/19.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "DialogViewController.h"
#import "Dialog.h"

@interface DialogViewController ()

@end

@implementation DialogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dialogShowAnimate = SeaDialogAnimateFromTop;
    self.dialogDismissAnimate = SeaDialogAnimateFromTop;
    Dialog *dialog = [Dialog new];
    [self.dialog addSubview:dialog];
    [dialog sea_insetsInSuperview:UIEdgeInsetsZero];
    [self.dialog sea_widthToSelf:240];
    [self.dialog sea_centerInSuperview];
    
    [dialog.cancel_btn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
}

- (void)cancel
{
    if(self.keyboardHidden){
         [self dismissDialog];
    }else{
        [[UIApplication sharedApplication].keyWindow endEditing:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
