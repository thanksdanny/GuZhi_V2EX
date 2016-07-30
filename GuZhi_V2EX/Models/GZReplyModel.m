//
//  GZReplyModel.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/31/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZReplyModel.h"
#import "GZMemberModel.h"

@implementation GZReplyModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"replyId"              : @"id",
             @"replyThanksCount"     : @"thanks",
             @"replyContent"         : @"content",
             @"replyContentRendered" : @"content_rendered",
             @"replyCreator"         : @"member",
             @"replyCreated"         : @"created",
             @"replyModified"        : @"last_modified",
             };
}

+ (NSValueTransformer *)memberJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [MTLJSONAdapter modelOfClass:[GZMemberModel class] fromJSONDictionary:value error:nil];
    }];
}

@end


@implementation GZReplyList

- (instancetype)initWithArray:(NSArray *)array {
    if (self = [super init]) {
        NSMutableArray *list = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in array) {
            NSError *error = nil;
            GZReplyModel *model = [[GZReplyModel alloc] initWithDictionary:dict error:&error];
            [list addObject:model];
        }
        self.list = list;
    }
    return self;
}

@end