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

+ (instancetype)sharedInstance;

#pragma mark - GET
- (void)getHotTopicsSuccess:(void (^)(NSArray *list))success
                     failed:(void (^)(NSError *error))failure;

@end
