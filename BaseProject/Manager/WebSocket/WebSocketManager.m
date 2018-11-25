//
//  WebSocketManager.m
//  BaseProject
//
//  Created by eason yi on 2018/11/23.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "WebSocketManager.h"

@implementation WebSocketManager

static WebSocketManager *_instance;

+ (instancetype)shareWebSocketManager {
    //调用dispatch_once保证在多线程中也只被实例化一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[WebSocketManager alloc] init];
    });
    return _instance;
}

- (void)initSocketWithPath:(NSString *)path {
    _path = path;
    // App从后台返回前台的时候连接
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(connect)
                                                 name:UIApplicationDidBecomeActiveNotification object:nil];
    // App进入后台的时候断开Websocket
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(close) name: UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)connect {
    if (_path == nil || [_path isEqualToString:@""]) {
        NSLog(@"请设置websocket地址");
        return;
    }
    _socket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:_path] protocols:nil allowsUntrustedSSLCertificates:YES];
    _socket.delegate = self;
    [_socket open];
}

- (void)close {
    if (_socket) {
        NSLog(@"断开Websocket");
        [_socket close];
    }
}

- (void)sendMessage:(NSString *) msg {
    if (_socket.readyState == SR_OPEN) {
        [_socket send:msg];
    }else {
        NSLog(@"发送失败，websocket状态: %ld",(long)SR_OPEN);
    }
}

#pragma mark - SRWebSocketDelegate

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message  {
    NSLog(@"收到Websocket信息: %@", message);
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    NSLog(@"已连接上Websocket地址: %@", _path);
    [self startHeartBeat];
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    
    NSLog(@":( Websocket错误: %@", error);
    
//    WeakSelf(weakSelf);
//    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0/*延迟执行时间*/ * NSEC_PER_SEC));
//    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
//        NSLog(@"Websocket重连");
//        [weakSelf.socket open];
//    });
    
//    NSLog(@"连接失败，这里可以实现掉线自动重连，要注意以下几点");
//    NSLog(@"1.判断当前网络环境，如果断网了就不要连了，等待网络到来，在发起重连");
//    NSLog(@"2.判断调用层是否需要连接，例如用户都没在聊天界面，连接上去浪费流量");
//    NSLog(@"3.连接次数限制，如果连接失败了，重试10次左右就可以了，不然就死循环了。或者每隔1，2，4，8，10，10秒重连...f(x) = f(x-1) * 2, (x=5)");
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    NSLog(@"连接断开，清空socket对象，清空该清空的东西，还有关闭心跳！");
    _socket = nil;
}

- (void)startHeartBeat {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(ping) userInfo:nil repeats:YES];
    [_timer fire];
    _pingToPongCount = 0;
}

- (void)stopHeartBeat {
    [_timer invalidate];
    _timer = nil;
}

- (void)ping {
    NSLog(@"socket心跳Ping~");
    if (_socket.readyState == SR_OPEN) {
        [_socket sendPing:nil];
    }
    _pingToPongCount++;
    if (_pingToPongCount > 2) {
        NSLog(@"多次ping后无服务器响应pong，重连socket.");
        _pingToPongCount = 0;
        [self connect];
    }
}

-(void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload{
    NSLog(@"服务器响应Pong~");
    _pingToPongCount = 0;
}


@end
