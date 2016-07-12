//
//  HotModel.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/12/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "HotModel.h"

@implementation HotModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"id" : @"id",
             @"title" : @"title",
             @"url" : @"url",
             @"content" : @"content",
             @"content_rendered" : @"content_rendered",
             @"replies" : @"replies",
             @"created" : @"created",
             @"last_modified" : @"last_modified",
             @"last_touched" : @"last_touched",
//             @"member" : @"member",
//             @"node" : @"node",
             };
}

@end
