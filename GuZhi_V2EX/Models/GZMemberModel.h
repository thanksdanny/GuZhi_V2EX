//
//  GZMemberModel.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface GZMemberModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *memberId;
@property (nonatomic, copy) NSString *memberName;
@property (nonatomic, copy) NSString *memberTagline;
@property (nonatomic, copy) NSString *memberAvatarMini;
@property (nonatomic, copy) NSString *memberAvatarNormal;
@property (nonatomic, copy) NSString *memberAvatarLarge;

@end

