//
//  GZHotModel.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZHotModel.h"
#import "GZMemberModel.h"
#import "GZNodeModel.h"

@implementation GZHotModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"id"               : @"id",
             @"title"            : @"title",
             @"url"              : @"url",
             @"content"          : @"content",
             @"content_rendered" : @"content_rendered",
             @"replies"          : @"replies",
             @"created"          : @"created",
             @"last_modified"    : @"last_modified",
             @"last_touched"     : @"last_touched",
             @"member"           : @"member",
             @"node"             : @"node",
             };
}


+ (NSValueTransformer *)memberJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        NSError *err = nil;
        id result = [MTLJSONAdapter modelOfClass:[GZMemberModel class] fromJSONDictionary:value error:&err];
        return result;
    }];
}

+ (NSValueTransformer *)nodeJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [MTLJSONAdapter modelOfClass:[GZNodeModel class] fromJSONDictionary:value error:nil];
    }];
}


@end