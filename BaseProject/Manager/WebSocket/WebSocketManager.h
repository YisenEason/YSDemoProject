//
//  WebSocketManager.h
//  BaseProject
//
//  Created by eason yi on 2018/11/23.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SRWebSocket.h>

@interface WebSocketManager : NSObject <SRWebSocketDelegate>

@property (strong, nonatomic) SRWebSocket * socket;
// socket地址
@property (strong, nonatomic) NSString *path;
// 心跳定时器
@property (strong, nonatomic) NSTimer* timer;
// 当发送ping时候+1，当接收pong时候置0，此参数大于5的时候，重连socket.
@property (nonatomic) NSInteger pingToPongCount;

+ (instancetype)shareWebSocketManager;

- (void)initSocketWithPath:(NSString *)path;

- (void)connect;

- (void)close;

@end
