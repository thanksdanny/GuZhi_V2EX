//
//  GZNodeModel.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface GZNodeModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *nodeId;
@property (nonatomic, copy) NSString *nodeName;
@property (nonatomic, copy) NSString *nodeUrl;
@property (nonatomic, copy) NSString *nodeTitle;
@property (nonatomic, copy) NSString *nodeTitleAlternative;
@property (nonatomic, copy) NSString *nodeTopicCount;
@property (nonatomic, copy) NSString *nodeHeader;
@property (nonatomic, copy) NSString *nodeFooter;
@property (nonatomic, copy) NSString *nodeCreated;

@end
