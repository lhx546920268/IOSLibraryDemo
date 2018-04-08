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
    
    self.showAnimate = SeaDialogAnimateUpDown;
    self.dismissAnimate = SeaDialogAnimateUpDown;
    Dialog *dialog = [Dialog new];
    [self.view addSubview:dialog];
    [dialog sea_widthToSelf:240];
    [dialog sea_centerInSuperview];
    self.dialog = dialog;
    
    [dialog.cancel_btn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
}

- (void)cancel
{
    if(self.keyboardHidden){
         [self dismiss];
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
