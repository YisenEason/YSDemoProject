//
//  NetworkManager.m
//  NetworkManager
//
//  Created by mac on 2018/1/8.
//  Copyright © 2018年 baby. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

static NetworkManager *_instance;

+ (instancetype)shareNetworkManager {
    //调用dispatch_once保证在多线程中也只被实例化一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[NetworkManager alloc] init];
    });
    return _instance;
}

- (id)init {
    self = [super init];
    if (self){
        
    }
    return self;
}

- (void)GetWithUrl:(NSString *)url
        parameters:(NSDictionary *)parameters
        modelClass:(Class) modelClass
        success:(void (^)(id result))successful
        failure:(void (^) (NSError *error, id result))failure {
    //开始请求内容
    [_sessionManager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error;
        // Dictionary转为Model
        ResponeModel *responeModel = [[modelClass alloc] initWithDictionary:responseObject error:&error];
        if (error) {
            // 失败
            failure(error,nil);
            return;
        }
        if (responeModel.code != NetSuccessCode) {
            NSError *error = [[NSError alloc] initWithDomain:@"InterfaceError" code:responeModel.code userInfo:@{NSLocalizedDescriptionKey:responeModel.message}];
            failure(error,responeModel);
            return;
        }
        
        successful(responeModel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        failure(error, nil);
    }];

}


- (void)PostWithUrl:(NSString *)url
        parameters:(NSDictionary *)parameters
        modelClass:(Class) modelClass
        success:(void (^)(id result))successful
        failure:(void (^) (NSError *error, id result))failure {
    //开始请求内容
    [_sessionManager POST:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error;
        // Dictionary转为Model
        ResponeModel *responeModel = [[modelClass alloc] initWithDictionary:responseObject error:&error];
        if (error) {
            // 失败
            failure(error,nil);
            return;
        }
        if (responeModel.code != NetSuccessCode) {
            NSError *error = [[NSError alloc] initWithDomain:@"InterfaceError" code:responeModel.code userInfo:@{NSLocalizedDescriptionKey:responeModel.message}];
            failure(error,responeModel);
        }else {
            successful(responeModel);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        failure(error, nil);
    }];

    
}


- (void)HeaderUploadWithUrl:(NSString *)url parameters:(NSDictionary *)paramters
            pictureData:(NSData *)pictureData
             pictureKey:(NSString *)pictureKey
               progress:(HttpProgress)progress
                success:(void (^) (id responseObject))successful
                failure:(void (^) (NSError *error))failure {

    [_sessionManager POST:url parameters:paramters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //对上传完文件的配置
        //获取当前时间（int 时间戳转换）
        int nowDate = [[NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]]intValue];
        NSString *fileName = [NSString stringWithFormat:@"%d.jpg",nowDate];
        //参数介绍
        //fileData : 图片资源  name : 预定key   fileName  : 文件名  mimeType    : 资源类型(根据后台进行对应配置)
       [formData appendPartWithFileData:pictureData name:pictureKey fileName:fileName mimeType:@"image/jpeg"];

    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(uploadProgress) : nil;
        });
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successful(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //可以将http响应码返回，以便于判断错误
        failure(error);
    }];

}



- (void)downloadWithUrl:(NSString *)url
        progress:(HttpProgress)progress
        downloadFilePath:(NSString *)downloadFilePath
        success:(void (^) (id responseObject))successful
        failure:(void (^) (NSError *error))failure {
    //下载地址
    NSURL *downloadURL = [NSURL URLWithString:url];
    //设置请求
    NSURLRequest *request = [NSURLRequest requestWithURL:downloadURL];
    //下载操作
    [_sessionManager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //下载进度
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(downloadProgress) : nil;
        });
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //拼接缓存目录
        NSString *downloadPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:downloadFilePath ? downloadFilePath : @"Download"];
        //打开文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //创建Download目录
        [fileManager createDirectoryAtPath:downloadPath withIntermediateDirectories:YES attributes:nil error:nil];
        //拼接文件路径
        NSString *filePath = [downloadPath stringByAppendingPathComponent:response.suggestedFilename];
        //返回文件位置的URL路径
        return [NSURL fileURLWithPath:filePath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSInteger responseCode = [self showResponseCode:response];
        if (responseCode != 200) {
            successful ? successful(filePath.absoluteString): nil;
        }else {
            failure(error);
        }
    }];
}

#pragma mark - 初始化AFHTTPSessionManager相关属性
/**
 开始监测网络状态
 */
+ (void)load {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}
/**
 *  所有的HTTP请求共享一个AFHTTPSessionManager
 */
+ (void)initialize {
    _sessionManager = [AFHTTPSessionManager manager];
    _sessionManager.requestSerializer.timeoutInterval = 30.f;
    _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*", nil];
    // 此处可添加对应的等待效果
}

#pragma mark - 重置AFHTTPSessionManager相关属性

+ (void)setAFHTTPSessionManagerProperty:(void (^)(AFHTTPSessionManager *))sessionManager {
    sessionManager ? sessionManager(_sessionManager) : nil;
}

+ (void)setRequestSerializer:(RequestSerializer)requestSerializer {
    _sessionManager.requestSerializer = requestSerializer == RequestSerializerHTTP ? [AFHTTPRequestSerializer serializer] : [AFJSONRequestSerializer serializer];
}

+ (void)setResponseSerializer:(ResponseSerializer)responseSerializer {
    _sessionManager.responseSerializer = responseSerializer == ResponseSerializerHTTP ? [AFHTTPResponseSerializer serializer] : [AFJSONResponseSerializer serializer];
}

+ (void)setRequestTimeoutInterval:(NSTimeInterval)time {
    _sessionManager.requestSerializer.timeoutInterval = time;
}

+ (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field {
    [_sessionManager.requestSerializer setValue:value forHTTPHeaderField:field];
}


+ (void)setSecurityPolicyWithCerPath:(NSString *)cerPath validatesDomainName:(BOOL)validatesDomainName {
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    // 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    // 如果需要验证自建证书(无效证书)，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    // 是否需要验证域名，默认为YES;
    securityPolicy.validatesDomainName = validatesDomainName;
    securityPolicy.pinnedCertificates = [[NSSet alloc] initWithObjects:cerData, nil];
    
    [_sessionManager setSecurityPolicy:securityPolicy];
}


/**
 输出http响应的状态码

 @param response 响应数据
 */
- (NSUInteger)showResponseCode:(NSURLResponse *)response {
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    NSInteger responseStatusCode = [httpResponse statusCode];
    return responseStatusCode;
}

@end

