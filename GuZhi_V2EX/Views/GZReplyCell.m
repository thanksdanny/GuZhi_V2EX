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


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    /*
     所以建议在awakeFromNib方法中进行初始化的额外操作。因为awakeFromNib是在初始化完成后调用，所以在这个方法里面访问属性（IBOutlet）就可以保证不为nil。
     */
    
}


#pragma mark - Data Methods

- (void)setModel:(GZReplyModel *)model {
    _model = model;
    self.userName.text = [model.member valueForKey:@"username"];
    
//    // 头像
    self.avatar.layer.cornerRadius = 3;
    self.avatar.layer.masksToBounds = YES;
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https:%@", [_model.member valueForKey:@"avatar_mini"]]] placeholderImage:[UIImage imageNamed:@"avatar_plasehoder"]];
    
    // 回复内容
    
    //    GZReplyModel *replyObject = self.replyDataList.list[indexPath.row];
//    UIFont *countFont = [UIFont systemFontOfSize:14];
//    CGSize countSize = [_model.content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 69, 10000)
//                                                         options:NSStringDrawingUsesLineFragmentOrigin
//                                                      attributes:@{NSFontAttributeName: countFont}
//                                                         context:nil].size;
    //    UILabel *replyContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(58, 40, cellContentWidth - 8, countSize.height)];
    self.replyContentLabel.font = [UIFont systemFontOfSize:14];
    self.replyContentLabel.text = _model.content;
    self.replyContentLabel.numberOfLines = 0;
//    self.replyContentLabel.backgroundColor =[UIColor blackColor];
    self.replyContentLabel.textColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:1];
//        [replyCell.contentView addSubview:replyContentLabel];
    
    
    
}

@end
