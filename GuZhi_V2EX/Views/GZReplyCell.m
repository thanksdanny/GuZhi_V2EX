//
//  GZReplyCell.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 8/2/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZReplyCell.h"
#import "GZMemberModel.h"

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
    self.userName.text = model.replyCreator.memberName;
    
}

@end
