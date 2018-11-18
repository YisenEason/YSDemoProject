//
//  WebViewController.m
//  Klup
//
//  Created by eason yi on 2018/11/14.
//  Copyright © 2018年 XXXX Technology Co.,Ltd. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <WKNavigationDelegate, WKUIDelegate>

@property(nonatomic,strong) WKWebView* webView;

@end

@implementation WebViewController

- (void)loadView {
    self.view = self.webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)dealloc {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (WKWebView *)webView {
    if (_webView == nil) {
        _webView = [WKWebView new];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
    }
    return _webView;
}

- (void)setUrl:(NSString *)url {
    _url = url;
    
    [self view];
    
    if(url) {
        NSURL* nsurl = [NSURL URLWithString:url];
        NSURLRequest* request = [NSURLRequest requestWithURL:nsurl];
        [self.webView loadRequest:request];
        [[HUDManager shareHUDManager] showLoadingInView:self.view];
    }
}

#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    [[HUDManager shareHUDManager] hideLoadingInView:self.view];
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    [[HUDManager shareHUDManager] hideLoadingInView:self.view];
    [[HUDManager shareHUDManager] showMessage:@"加载失败" view:self.view];
}
// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"title"]){
        if (object == self.webView) {
            self.title = self.webView.title;
        }
    }
}

@end
