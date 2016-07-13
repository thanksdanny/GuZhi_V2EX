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


- (instancetype)initWithDict:(NSDictionary *)dictionary {
    self = [super init];
//    if (![dictionary[]) {
//        <#statements#>
//    }
    
    return self;
}


- (NSDictionary *)toDictionary {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
//    if (self.content_rendered) {
//        <#statements#>
//    }
    return dictionary;
}

/**
 模型数据的加载，返回arry以后我们就只要使用array就能使用这个模型类里面的数据也就是使用plist数据
 */
//懒加载plist文件，返回一个数据，后面直接使用旧可以
- (NSMutableArray *)hotArray {
    if (!_hotArray) {
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HotList.plist" ofType:nil]];
        NSMutableArray *hotArray = [NSMutableArray array];
        
        for (NSDictionary *dic in arr) {
            HotModel *model = [[HotModel alloc] initWithDict:dic];
            
            [hotArray addObject:model];
        }
        
    }
}

@end
