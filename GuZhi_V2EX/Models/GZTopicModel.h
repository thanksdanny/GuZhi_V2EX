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

@property (nonatomic, copy) NSString *topicId;
@property (nonatomic, copy) NSString *topicTitle;
@property (nonatomic, copy) NSString *topicUrl;
@property (nonatomic, copy) NSString *topicContent;
@property (nonatomic, copy) NSString *topicContentRendered;
@property (nonatomic, copy) NSString *topicReplyCount;
@property (nonatomic, copy) NSNumber *topicCreated;
@property (nonatomic, copy) NSString *topicModified;
@property (nonatomic, copy) NSString *topicTouched;

@property (nonatomic, strong) GZMemberModel *topicCreator;
@property (nonatomic, strong) GZNodeModel   *topicNode;

@end


@interface GZTopicList : NSObject

@property (nonatomic, strong) NSArray *list;

- (instancetype)initWithArray:(NSArray *)array;

@end

