//
//  GZMemberModel.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZMemberModel.h"

@implementation GZMemberModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"memberId"           : @"id",
             @"memberName"         : @"username",
             @"memberTagline"      : @"tagline",
             @"memberAvatarMini"   : @"avatar_mini",
             @"memberAvatarNormal" : @"avatar_normal",
             @"memberAvatarLarge"  : @"avatar_large",
             };
}
@end
