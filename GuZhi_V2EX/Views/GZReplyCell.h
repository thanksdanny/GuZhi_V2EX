//
//  GZReplyCell.h
//  GuZhi_V2EX
//
//  Created by Danny Ho on 8/2/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZReplyModel.h"

@interface GZReplyCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *createdDate;
@property (weak, nonatomic) IBOutlet UILabel *replyContentLabel;

@property (nonatomic, strong) GZReplyModel *model;

@end
