//
//  GZTopicListCell.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 6/30/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZTopicListCell.h"

@interface GZTopicListCell ()

@end


@implementation GZTopicListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

#pragma mark - Data Methods

- (void)setModel:(GZHotModel *)model {
    _model = model;
    
    self.clipsToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.titleLable.text = model.title;
    
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    
//}

@end
