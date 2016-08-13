//
//  GZDataManager.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GZHotModel.h"

@class GZTopicModel;
@class GZReplyList;
@class GZTopicList;

@interface GZDataManager : NSObject

@property (nonatomic, assign) BOOL preferHttps;

// 单例
+ (instancetype)shareManager;

#pragma mark - GET

// 请求hot
- (NSURLSessionDataTask *)getHotTopicsSuccess:(void (^)(NSArray *hotArray))succes
                                      failure:(void (^)(NSError *error))failure;

// 请求主题详情
- (NSURLSessionDataTask *)getTopicWithTopicId:(NSNumber *)topicId
                                      success:(void (^)(GZTopicModel *model))success
                                      failure:(void (^)(NSError *error))failure;


// 请求详情评论
- (NSURLSessionDataTask *)getRepliesWithTopicId:(NSNumber *)topicId
                                        success:(void (^)(NSArray *repliesArray))success
                                        failure:(void (^)(NSError *error))failure;

@end
