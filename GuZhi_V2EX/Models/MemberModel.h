//
//  MemberModel.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/13/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface MemberModel : MTLModel

@property (nonatomic, copy) NSString *memberId;
@property (nonatomic, copy) NSString *memberName;
@property (nonatomic, copy) NSString *memberAvatarMini;
@property (nonatomic, copy) NSString *memberAvatarNormal;
@property (nonatomic, copy) NSString *memberAvatarLarge;
@property (nonatomic, copy) NSString *memberTagline;

@property (nonatomic, copy) NSString *memberBio;
@property (nonatomic, copy) NSString *memberCreated;
@property (nonatomic, copy) NSString *memberLocation;
@property (nonatomic, copy) NSString *memberStatus;
@property (nonatomic, copy) NSString *memberTwitter;
@property (nonatomic, copy) NSString *memberUrl;
@property (nonatomic, copy) NSString *memberWebsite;

@end
