//
//  GZHelper.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 8/9/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZHelper : NSObject

/**
 *  日期时间
 */

+ (NSString *)timeRemainDescriptionWithDateSP:(NSNumber *)dateSP;
+ (NSString *)timeRemainDescriptionWithUTCString:(NSString *)dateString;

// interval
+ (NSTimeInterval)timeIntervalWithUTCString:(NSString *)dateString;

// local
+ (NSArray *)localDateStringWithUTCString:(NSString *)dateString;


// text
+ (CGFloat)getTextHeightWithText:(NSString *)text Font:(UIFont *)font;
+ (CGFloat)getTextHeightWithText:(NSString *)text Font:(UIFont *)font width:(CGFloat)width;

@end
