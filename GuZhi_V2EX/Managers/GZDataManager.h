//
//  GZDataManager.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/23/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GZTopicList.h"

@interface GZDataManager : NSObject

@property (nonatomic, assign) BOOL preferHttps;

# pragma mark - GET

- (NSURLSessionDataTask *)getTopicListLatestWithPage:(NSInteger)page
                                             Success:(void (^)(GZTopicList *list))success
                                             failure:(void (^)(NSError *error))failure;


@end
