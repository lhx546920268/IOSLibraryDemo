//
//  WebViewJSViewController.m
//  IOSLibraryDemo
//
//  Created by 罗海雄 on 2018/3/6.
//  Copyright © 2018年 罗海雄. All rights reserved.
//

#import "WebViewJSViewController.h"

@interface WebViewJSViewController ()<WKScriptMessageHandler, WKUIDelegate>

@end

@implementation WebViewJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.URL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"]];
    [self loadWebContent];
    
    self.webView.UIDelegate = self;
    
    [self.webView.configuration.userContentController addScriptMessageHandler:self name:@"zegoPay"];
}

- (void)dealloc
{
    [self.webView.configuration.userContentController removeScriptMessageHandlerForName:@"zegoPay"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    [self.webView evaluateJavaScript:@"ocRunJs([1,2,3])" completionHandler:^(id callback, NSError *error){

        NSLog(@"%@", error);
        NSLog(@"%@", callback);
    }];
    NSLog(@"%f", NSDate.date.timeIntervalSince1970 * 1000);
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    NSLog(@"alert %@", message);
    !completionHandler ?: completionHandler();
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
