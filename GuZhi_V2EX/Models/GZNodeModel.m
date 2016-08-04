//
//  GZNodeModel.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZNodeModel.h"

@implementation GZNodeModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"id"                : @"id" ,
             @"name"              : @"name",
             @"title"             : @"title",
             @"title_alternative" : @"title_alternative",
             @"url"               : @"url" ,
             @"topics"            : @"topics",
             @"avatar_mini"       : @"avatar_mini",
             @"avatar_normal"     : @"avatar_normal",
             @"avatar_large"      :  @"avatar_large",
             };
}

@end
