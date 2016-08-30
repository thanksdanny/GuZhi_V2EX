//
//  GZHomeViewCell.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 8/23/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GZTopicModel;

@interface GZHomeViewCell : UITableViewCell

@property (nonatomic, strong) GZTopicModel *model;
@property (nonatomic, assign) BOOL isTop;

+ (CGFloat)getCellHeightWithTopicModel:(GZTopicModel *)model;
+ (CGFloat)heightWithTopicModel:(GZTopicModel *)model;


@end
