//
//  GZLeftMenuViewController.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 8/14/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol nodeSelectDelegate <NSObject>

- (void)nodeSelectAtIndex:(NSString *)code Name:(NSString *)name Index:(NSInteger)index;

@end

@interface GZLeftMenuViewController : UIViewController

@property (nonatomic, assign) id<nodeSelectDelegate> delegate;

@end
