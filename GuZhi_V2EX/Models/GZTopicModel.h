//
//  GZTopicModel.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/31/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <Mantle/Mantle.h>

@class GZMemberModel;
@class GZNodeModel;

@interface GZTopicModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *content_rendered;
@property (nonatomic, copy) NSString *replies;
@property (nonatomic, copy) NSNumber *created;
@property (nonatomic, copy) NSString *last_modified;
@property (nonatomic, copy) NSString *last_touched;

@property (nonatomic, strong) GZMemberModel *member;
@property (nonatomic, strong) GZNodeModel   *node;

@end


@interface GZTopicList : NSObject

@property (nonatomic, strong) NSArray *list;

- (instancetype)initWithArray:(NSArray *)array;

@end

