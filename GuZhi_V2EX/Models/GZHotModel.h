//
//  GZHotModel.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <Mantle/Mantle.h>

@class GZMemberModel;
@class GZNodeModel;

@interface GZHotModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *content_rendered;
@property (nonatomic, copy) NSNumber *replies;
@property (nonatomic, copy) NSNumber *created;
@property (nonatomic, copy) NSNumber *last_modified;
@property (nonatomic, copy) NSNumber *last_touched;

@property (nonatomic, copy) GZMemberModel *member;
@property (nonatomic, copy) GZNodeModel *node;

@property (nonatomic, assign) NSArray *hotArray;

@end


@interface GZHotList : NSObject

@property (nonatomic, strong) NSArray *list;

- (instancetype)initWithArray:(NSArray *)array;

@end
