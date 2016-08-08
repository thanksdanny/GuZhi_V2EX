//
//  GZReplyCell.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 8/2/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZReplyCell.h"
#import "GZMemberModel.h"

#import "UIImageView+WebCache.h"

@interface GZReplyCell ()

@end

@implementation GZReplyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.clipsToBounds = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self configureViews];
    }
    return self;
}

#pragma mark - configureViews

- (void)configureViews {
    NSLog(@"detail heihei");
}

#pragma mark - Data Methods

- (void)setModel:(GZReplyModel *)model {
    _model = model;
    NSLog(@"cell--进入setModel方法");
    self.userName.text = [model.member valueForKey:@"username"];
    
    // 头像
    self.avatar.layer.cornerRadius = 3;
    self.avatar.layer.masksToBounds = YES;
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https:%@", [_model.member valueForKey:@"avatar_mini"]]] placeholderImage:[UIImage imageNamed:@"avatar_plasehoder"]];
    
}

@end
