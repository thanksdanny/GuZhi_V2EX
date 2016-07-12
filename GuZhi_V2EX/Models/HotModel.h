//
//  HotModel.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/12/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface HotModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *content_rendered;
@property (nonatomic, copy) NSString *replies;
@property (nonatomic, copy) NSNumber *created;
@property (nonatomic, copy) NSString *last_modified;
@property (nonatomic, copy) NSString *last_touched;

//@property (nonatomic, copy) MemberModel *member;
//@property (nonatomic, copy) NodeModel *node;


@end
