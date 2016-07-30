//
//  GZReplyModel.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/31/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <Mantle/Mantle.h>

@class GZMemberModel;

@interface GZReplyModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy  ) NSString      *replyId;
@property (nonatomic, copy  ) NSString      *replyThanksCount;
@property (nonatomic, copy  ) NSString      *replyContent;
@property (nonatomic, copy  ) NSString      *replyContentRendered;
@property (nonatomic, strong) GZMemberModel *replyCreator;
@property (nonatomic, strong) NSNumber      *replyCreated;
@property (nonatomic, copy  ) NSString      *replyModified;

@end

@interface GZReplyList : NSObject

@property (nonatomic, strong) NSArray *list;

- (instancetype)initWithArray:(NSArray *)array;

@end
