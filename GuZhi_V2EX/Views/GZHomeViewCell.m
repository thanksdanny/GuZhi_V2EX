//
//  GZHomeViewCell.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 8/23/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZHomeViewCell.h"
#import "GZTopicModel.h"
#import "GZHelper.h"

#import "UIImageView+WebCache.h"


static CGFloat const kAvatarHeight          = 26.0f;
static CGFloat const kBottomFontSize        = 12.0f;
static CGFloat const kTitleFontSize         = 17.0f;

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kTitleLabelWidth (kScreenWidth - 56)
@interface GZHomeViewCell ()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *replycountAndTimesLabel;

@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *borderLineView;

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGFloat titleHeight;

@end

@implementation GZHomeViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.000];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self configureViews];
    }
    
    return self;
}

#pragma mark - layout

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.topLineView.frame = CGRectMake(0, 0, kScreenWidth, 0.5);
    self.topLineView.hidden = !self.isTop;
    
    self.avatarImageView.frame = (CGRect){kScreenWidth - 10 - kAvatarHeight, 13, kAvatarHeight, kAvatarHeight};
    
    self.titleLabel.frame = CGRectMake(10, 15, kTitleLabelWidth, self.titleHeight);
    
    self.borderLineView.frame = CGRectMake(0, self.frame.size.height - 0.5, kScreenWidth, 0.5);
}

#pragma mark - configure

- (void)configureViews {
    // avatar
    self.avatarImageView = [[UIImageView alloc] init];
    self.avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    //    self.avatarImageView.layer.cornerRadius = 3; //kAvatarHeight/2.0;
    //    self.avatarImageView.clipsToBounds      = YES;
    self.avatarImageView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.avatarImageView];

    
    // nameLabel
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.backgroundColor = [UIColor clearColor];
    self.nameLabel.font = [UIFont systemFontOfSize:kBottomFontSize];
    self.nameLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.nameLabel];
    
    
    // titleLabel
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont systemFontOfSize:kTitleFontSize];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail|NSLineBreakByCharWrapping;
    [self addSubview:self.titleLabel];
    

    // replycountAndTimesLabel
    self.replycountAndTimesLabel = [[UILabel alloc] init];
    self.replycountAndTimesLabel.backgroundColor = [UIColor clearColor];
    self.replycountAndTimesLabel.textColor = [UIColor whiteColor];
    self.replycountAndTimesLabel.font = [UIFont systemFontOfSize:8];
    self.replycountAndTimesLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.replycountAndTimesLabel];
    
    // toplineView
    self.topLineView = [[UIView alloc] init];
    [self addSubview:self.topLineView];
    
    // borderLineView
    self.borderLineView = [[UIView alloc] init];
    [self addSubview:self.borderLineView];
    
}

#pragma mark - data methods

- (void)setModel:(GZTopicModel *)model {
    _model = model;
    
    // 头像
    NSString *avatar = [[_model valueForKey:@"member"] valueForKey:@"avatar_mini"];
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://%@", avatar]] placeholderImage:[UIImage imageNamed:@"avatar_placeholder"]];
    
    // 标题
    self.nameLabel.text = model.title;
    
    // 时间戳 + 回复数
    NSString *createdTimeStr = [GZHelper timeRemainDescriptionWithDateSP:_model.created];
    NSString *replyCountStr = [NSString stringWithFormat:@"%@ 回复", _model.replies];
    self.replycountAndTimesLabel.numberOfLines = 0;
    self.replycountAndTimesLabel.textColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:1];
    self.replycountAndTimesLabel.text = [NSString stringWithFormat:@"%@/%@", createdTimeStr, replyCountStr];
    
    // 用户名
    NSString *usernameStr = [[model valueForKey:@"member"] valueForKey:@"username"];
    self.nameLabel.text = usernameStr;
}


#pragma mark - class methods

+(CGFloat)getCellHeightWithTopicModel:(GZTopicModel *)model {
    if (model.cellHeight > 10) {
        return model.cellHeight;
    } else {
        return [self heightWithTopicModel:model];
    }
}

+ (CGFloat)heightWithTopicModel:(GZTopicModel *)model {
    NSInteger titleHeight = [GZHelper getTextHeightWithText:model.title Font:[UIFont systemFontOfSize:kTitleFontSize] width:kTitleLabelWidth] + 1;
    NSInteger bottomHeight = (NSInteger)[GZHelper getTextHeightWithText:model.title Font:[UIFont systemFontOfSize:kBottomFontSize] width:CGFLOAT_MAX] + 1;
    
    CGFloat cellHeight = 8 + 13 * 2 + titleHeight + bottomHeight;
    model.cellHeight = cellHeight;
    model.titleHeight = titleHeight;
    
    return cellHeight;
    
}


@end
