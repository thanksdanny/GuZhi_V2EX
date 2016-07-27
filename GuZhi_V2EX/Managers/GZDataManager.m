//
//  GZDataManager.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZDataManager.h"
#import <AFNetworking.h>
#import "GZHotModel.h"

#define BASE_URL @"https://www.v2ex.com/"

@interface GZDataManager ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation GZDataManager

+ (instancetype)sharedInstance {
    static GZDataManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GZDataManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // 创建会话管理者
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        self.sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}


- (void)getTopics:(NSString *)url
       parameters:(NSDictionary *)parameters
          success:(void (^)(NSArray *list))success
          failure:(void (^)(NSError *error))failure {
//    下面这行应该不用写了，与初始化时的重复了
//    self.sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [self.sessionManager GET:url
                  parameters:parameters
                    progress:nil
                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         NSError *error;
                         NSMutableArray *topics = [@[] mutableCopy];
                         if ([responseObject isKindOfClass:[NSArray class]]) {
                             for (id item in responseObject) {
                                 GZHotModel *hotTopic = [[GZHotModel alloc] initWithDictionary:item error:&error];
                                 if (hotTopic) {
                                     [topics addObject:hotTopic];
                                 }
                             }
                         }
                         if (!error) {
                             success(topics);
                         } else {
                             failure(error);
                         }
                         
                     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         failure(error);
                     }];
}

#pragma mark - GET

- (void)getHotTopicsSuccess:(void (^)(NSArray *))success
                     failed:(void (^)(NSError *))failure {
    NSString *url = [NSString stringWithFormat:@"api/topics/%@.json", @"hot"];
    [self getTopics:url
         parameters:nil
            success:success
            failure:failure];
}



@end
