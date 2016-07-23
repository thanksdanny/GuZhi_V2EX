//
//  GZTopicList.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/23/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZTopicList : NSObject

@property (nonatomic, strong) NSArray *list;

- (instancetype)initWithArray:(NSArray *)array;
+ (GZTopicList *)getTopicListFromResponseObject:(id)responseObject;

@end
