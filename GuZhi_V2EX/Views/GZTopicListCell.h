//
//  GZTopicListCell.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 6/30/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZHotModel.h"

@interface GZTopicListCell : UITableViewCell



@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (nonatomic, strong) GZHotModel *model;


@end
