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

// 貌似这方法没用 进不去用sb的话
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    NSLog(@"haha");
    if (self) {
        self.clipsToBounds = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self configureViews];
    }
    
    return self;
}


#pragma mark - Congifure Views

// 手写界面的时候在这配置ui
- (void)configureViews {
    NSLog(@"heihei");
}

#pragma mark - Data Methods

- (void)setModel:(GZHotModel *)model {
    _model = model;
    
    self.titleLable.text = model.title;
    
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    
//}

@end
