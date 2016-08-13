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

@property (nonatomic, copy  ) NSNumber      *id;
@property (nonatomic, copy  ) NSString      *thanks;
@property (nonatomic, copy  ) NSString      *content;
@property (nonatomic, copy  ) NSString      *content_rendered;
@property (nonatomic, strong) GZMemberModel *member;
@property (nonatomic, strong) NSNumber      *created;
@property (nonatomic, copy  ) NSString      *last_modified;

@end
