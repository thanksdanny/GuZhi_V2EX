//
//  GZDataManager.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/23/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZDataManager.h"
#import <AFNetworking.h>


typedef NS_ENUM(NSInteger, GZRequestMethod) {
    GZRequestMethodJSONGET    = 1,
    GZRequestMethodHTTPPOST   = 2,
    GZRequestMethodHTTPGET    = 3,
};

typedef NS_ENUM(NSInteger, GZErrorType) {
    GZErrorTypeNoOnceAndNext          = 700,
    GZErrorTypeLoginFailure           = 701,
    GZErrorTypeRequestFailure         = 702,
    GZErrorTypeGetFeedURLFailure      = 703,
    GZErrorTypeGetTopicListFailure    = 704,
    GZErrorTypeGetNotificationFailure = 705,
    GZErrorTypeGetFavUrlFailure       = 706,
    GZErrorTypeGetMemberReplyFailure  = 707,
    GZErrorTypeGetTopicTokenFailure   = 708,
    GZErrorTypeGetCheckInURLFailure   = 709,
};

@interface GZDataManager()

@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, copy) NSString *userAgentMobile;


@end

@implementation GZDataManager

- (void)setPreferHttps:(BOOL)preferHttps {
    _preferHttps = preferHttps;
    
    NSURL *baseUrl;
    baseUrl = [NSURL URLWithString:@"https://www.v2ex.com"];
    
    self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseUrl];
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    self.manager.requestSerializer = serializer;
    
}


// 请求方法
- (NSURLSessionDataTask *)requestWithMethod:(GZRequestMethod)method
                                  URLString:(NSString *)URLString
                                 parameters:(NSDictionary *)parameters
                                    success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                    failure:(void (^)(NSError *error))failure {
    // 状态栏
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    void (^responseHandleBlock)(NSURLSessionDataTask *task, id responseObject) = ^(NSURLSessionDataTask *task, id responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关掉菊花
        
        success(task, responseObject);
    };
    
    // 创建HTTPSession
    NSURLSessionDataTask *task = nil;
    
    [self.manager.requestSerializer setValue:self.userAgentMobile forHTTPHeaderField:@"User-Agent"];
    
    // JSON GET
    if (method == GZRequestMethodJSONGET) {
        AFHTTPResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
        self.manager.responseSerializer = responseSerializer;
        task = [self.manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            responseHandleBlock(task, responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"%@", [NSString stringWithFormat:@"Error:\n %@", [error description]]);
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            failure(error);
        }];
    }
    
    // HTTP GET
    if (method == GZRequestMethodHTTPGET) {
        AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
        self.manager.responseSerializer = responseSerializer;
        task = [self.manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            responseHandleBlock(task, responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            failure(error);
        }];
    }
    
    // HTTP POST
    if (method == GZRequestMethodHTTPPOST) {
        AFHTTPResponseSerializer *resposeSerializer = [AFHTTPResponseSerializer serializer];
        self.manager.responseSerializer = resposeSerializer;
        task = [self.manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            responseHandleBlock(task, responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            failure(error);
        }];
    }
    
    return task;
}


#pragma mark - Public Request Methods - GET

- (NSURLSessionDataTask *)getTopicListLatestWithPage:(NSInteger)page
                                             Success:(void (^)(GZTopicList *list))success
                                             failure:(void (^)(NSError *))failure {
    NSDictionary *parameters;
    if (page) {
        parameters = @{@"p": @(page)};
    }
    
    return [self requestWithMethod:GZRequestMethodHTTPGET URLString:@"recent" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        GZTopicList *list = [GZTopicList getTopicListFromResponseObject:responseObject];
        if (list) {
            success(list);
        } else {
            NSError *error = [[NSError alloc] initWithDomain:self.manager.baseURL.absoluteString code:GZErrorTypeGetTopicListFailure userInfo:nil];
            failure(error);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}


@end
