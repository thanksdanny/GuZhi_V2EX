//
//  GZTopicModel.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/31/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZTopicModel.h"
#import "GZMemberModel.h"
#import "GZNodeModel.h"

@implementation GZTopicModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"topicId"              : @"id",
             @"topicTitle"           : @"title",
             @"topicUrl"             : @"url",
             @"topicContent"         : @"content",
             @"topicContentRendered" : @"content_render",
             @"topicReplyCount"      : @"replies",
             @"topicCreator"         : @"member",
             @"topicNode"            : @"node",
             @"topicCreated"         : @"created",
             @"topicModified"        : @"last_modified",
             @"topicTouched"         : @"last_touched",
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

@end

@implementation GZTopicList

- (instancetype)initWithArray:(NSArray *)array {
    if (self = [super init]) {
        NSMutableArray *list = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in array) {
            NSError *error = nil;
            GZTopicModel *model = [[GZTopicModel alloc] initWithDictionary:dict error:&error];
            [list addObject:model];
        }
        self.list = list;
    }
    return self;
}

@end
