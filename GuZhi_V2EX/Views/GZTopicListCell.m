//
//  GZTopicListCell.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 6/30/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZTopicListCell.h"
#import "GZHotModel.h"
#import "GZMemberModel.h"
#import "GZHelper.h"

#import "UIImageView+WebCache.h"


@interface GZTopicListCell ()

@end


@implementation GZTopicListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

#pragma mark - Data Methods

- (void)setModel:(GZHotModel *)model {
    _model = model;
    NSLog(@"%@", model);
    
    self.clipsToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.titleLable.text = model.title;
    
    // 头像
    self.avatar.layer.cornerRadius = 3;
    self.avatar.layer.masksToBounds = YES;
    NSString *avatar = [[_model valueForKey:@"member"] valueForKey:@"avatar_mini"];
    NSLog(@"%@", avatar);
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https:%@", avatar]] placeholderImage:[UIImage imageNamed:@"avatar_placeholder"]];
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    
//}

@end
