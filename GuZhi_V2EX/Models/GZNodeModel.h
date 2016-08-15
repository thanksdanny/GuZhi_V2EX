//
//  GZNodeModel.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface GZNodeModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *title_alternative;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSNumber *topics;
@property (nonatomic, copy) NSString *avatar_mini;
@property (nonatomic, copy) NSString *avatar_normal;
@property (nonatomic, copy) NSString *avatar_large;

@end

@interface GZNodeObject : NSObject

@property (nonatomic, copy) NSString *nodeName;
@property (nonatomic, copy) NSString *nodeCode;
@property (nonatomic, copy) NSArray *childNodeArray;

- (id)initWithNodeName:(NSString *)name NodeCode:(NSString *)code;

@end

@interface GZChildNodeObject : NSObject

@property (nonatomic ,copy) NSString *childNodeName;
@property (nonatomic, copy) NSString *childNodeCode;

- (id)initWithChildNodeName:(NSString *)name CNode:(NSString *)code;

@end

