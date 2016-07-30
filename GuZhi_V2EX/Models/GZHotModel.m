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
             @"node" : @"node",
             };
}


+ (NSValueTransformer *)memberJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [MTLJSONAdapter modelOfClass:[GZMemberModel class] fromJSONDictionary:value error:nil];
    }];
}

+ (NSValueTransformer *)nodeJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [MTLJSONAdapter modelOfClass:[GZNodeModel class] fromJSONDictionary:value error:nil];
    }];
}

//+ (NSValueTransformer *)repliesJSONTransformer {
//    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
//        return @([value integerValue]).stringValue;
//    }];
//}
//
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


@implementation GZHotList

- (instancetype)initWithArray:(NSArray *)array {
    if (self = [super init]) {
        NSMutableArray *list = [[NSMutableArray alloc] init];
        NSError *error = nil;
        
        for (NSDictionary *dict in array) {
            GZHotModel *model = [[GZHotModel alloc] initWithDictionary:dict error:&error];
            [list addObject:model];
        }
        self.list = list;
    }
    
    return self;
}

@end