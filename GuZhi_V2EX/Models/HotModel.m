//
//  HotModel.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/12/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "HotModel.h"
#import "NodeModel.h"
#import "MemberModel.h"

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
             @"member" : @"member",
             //@"node" : @"node",
             };
}

+ (NSValueTransformer *)memberJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [MTLJSONAdapter modelOfClass:[MemberModel class] fromJSONDictionary:value error:nil];
    }];
}

+ (NSValueTransformer *)repliesJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return @([value integerValue]).stringValue;
    }];
}
//+ (NSValueTransformer *)URLJSONTransformer {
//    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
//}
//
//+ (NSValueTransformer *)HTMLURLJSONTransformer {
//    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
//}
//
//- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
//    self = [super initWithDictionary:dictionaryValue error:error];
//    if (self == nil) return nil;
//    
//    // Store a value that needs to be determined locally upon initialization.
//    
//    return self;
//}


@end
