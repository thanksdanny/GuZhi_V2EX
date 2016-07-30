//
//  GZDataManager.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GZHotModel.h"

@interface GZDataManager : NSObject

@property (nonatomic, assign) BOOL preferHttps;

// 单例
+ (instancetype)shareManager;

#pragma mark - GET

- (NSURLSessionDataTask *)getHotTopicsSuccess:(void (^)(GZHotList *list))succes
                                      failure:(void (^)(NSError *error))failure;

@end
