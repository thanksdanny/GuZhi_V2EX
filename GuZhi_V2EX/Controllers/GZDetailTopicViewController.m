//
//  GZDetailTopicViewController.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/31/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZDetailTopicViewController.h"
#import "GZDataManager.h"
#import "GZHotModel.h"
#import "GZReplyModel.h"
#import "GZMemberModel.h"
#import "GZReplyCell.h"

#import "UIImageView+WebCache.h"


@interface GZDetailTopicViewController () <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *detailTable;
    
    // 头部
    UIView       *headerView;
    UILabel      *title;
    UIImageView  *userAvatar;
    UILabel      *userName;
    UILabel      *replaceCount;
    UILabel      *nodeName;
    UILabel      *timeLabel;
    UILabel      *bottomLine;
    
    // 内容
    NSString     *content;
    UITextView   *articleLabel;
    
    
    CGFloat      cellContentWith;
}

// 回复
@property (nonatomic, strong) GZReplyList *replayDataList;

@end

@implementation GZDetailTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cellContentWith = [UIScreen mainScreen].bounds.size.width - 69; // 为啥69
    
    self.title = @"主题详情";
    
    headerView = [[UIView alloc] init];
    headerView.clipsToBounds = YES; // clipsToBounds:如果子视图的范围超出了父视图的边界，那么超出的部分就会被裁剪掉。
    
    NSString *dataString = self.info.title; // 这句可能有问题
    UIFont *dataFont = [UIFont systemFontOfSize:14];
    CGSize titleSize = [dataString boundingRectWithSize:CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 54, 400)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:dataFont}
                                                context:nil].size;
    
    
    // 标题lable
    title = [[UILabel alloc] init];
    title.textColor = [UIColor blueColor];
    title.font = dataFont;
    title.numberOfLines = 0;
    title.frame = CGRectMake(8, 10, titleSize.width, titleSize.height);
    title.text = self.info.title;
    [headerView addSubview:title];
    
    // 头像
//    userAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 38, 8, 30, 30)];
//    userAvatar.backgroundColor = [UIColor clearColor];
//    userAvatar.layer.cornerRadius = 3;
//    userAvatar.layer.masksToBounds = YES;
//    [userAvatar sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http:%@", self.info.member.memberAvatarMini]] placeholderImage:[UIImage imageNamed:@"avatar_placsehoder"]];
//    [headerView addSubview:userAvatar];
   
    // tag lable
    CGFloat uTagx = title.frame.size.height<17?title.frame.size.height+30:title.frame.size.height+13;
    UILabel *uTag = [[UILabel alloc] initWithFrame:CGRectMake(8, uTagx, 20, 30)];
    uTag.text = @"By";
    uTag.font = [UIFont systemFontOfSize:13];
    uTag.textColor = [UIColor grayColor];
    [headerView addSubview:uTag];
    
    // 楼主label
//    userName = [[UILabel alloc] init];
//    UIFont *nameFont = [UIFont boldSystemFontOfSize:12];
//    // 下面在这行报错 member为空
//    CGSize nameSize = [self.info.member.memberName boundingRectWithSize:CGSizeMake(100, 20)
//                                                                options:NSStringDrawingUsesLineFragmentOrigin
//                                                             attributes:@{NSFontAttributeName:nameFont}
//                                                                context:nil].size;
//    userName.font = nameFont;
//    userName.numberOfLines = 0;
//    userName.textColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:1];
//    userName.frame = CGRectMake(28, uTag.frame.origin.y, nameSize.width, 20);
//    userName.text = self.info.member.memberName;
//    [headerView addSubview:userName];
    
    // 底部线条
    bottomLine = [[UILabel alloc] init];
    bottomLine.frame = CGRectMake(8, uTag.frame.origin.y+26, CGRectGetWidth([UIScreen mainScreen].bounds)-16, 0.5);
    bottomLine.backgroundColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1];
    [headerView addSubview:bottomLine];
    
    // 内容
    articleLabel = [[UITextView alloc] init];
    [headerView addSubview:articleLabel];
    
    
    // 初始化table
    [self initTable];
    
    
    // 获取主题详情数据
    NSLog(@"主题详情请求开始");
    [[GZDataManager shareManager] getTopicWithTopicId:self.info.id success:^(GZTopicModel *model) {
        NSLog(@"%@", model);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    NSLog(@"结束");
    

    
     
    // 获取回复详情数据
    NSLog(@"请求回复开始");
    [[GZDataManager shareManager] getRepliesWithTopicId:self.info.id success:^(GZReplyList *list) {
        self.replayDataList = list;
        NSLog(@"%@", self.replayDataList.list);

        [detailTable reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    NSLog(@"请求回复结束");
}

- (void)initTable {
    detailTable.delegate = self;
    detailTable.dataSource = self;
    
    headerView.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), bottomLine.frame.origin.y + 2);
    headerView.backgroundColor = [UIColor redColor];
}

#pragma mark - Table view data source

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UIFont *countFont = [UIFont systemFontSize:14];
//    CGSize countSize = [[self.replayDataArray objectAtIndex:indexPath.row]]
//}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return headerView.frame.size.height;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.replayDataList.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"detail tableviewcell");
    GZReplyCell *replaycell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!replaycell) {
        replaycell= [[GZReplyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    GZReplyModel *replayObject = self.replayDataList.list[indexPath.row];
    UIFont *countFont = [UIFont systemFontOfSize:14];
    CGSize countSize = [[self.replayDataList.list objectAtIndex:indexPath.row] boundingRectWithSize:CGSizeMake(cellContentWith, 10000)
                                                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                                                     attributes:@{NSFontAttributeName: countFont}
                                                                                        context:nil].size;
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(58, 40, cellContentWith - 8, countSize.height)];
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.text = replayObject.content;
    contentLabel.numberOfLines = 0;
    contentLabel.textColor = [UIColor greenColor];
    [replaycell.contentView addSubview:contentLabel];
    
    // 头像
//    cell.avatar.layer.cornerRadius = 3;
//    cell.avatar.layer.masksToBounds = YES;
//    [cell.avatar sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http:%@", replay.memberAvatarMini]] placeholderImage:[UIImage imageNamed:@"avatar_plasehoder"];
    
    
    return [self configureTopicCellWithCell:replaycell IndexPath:indexPath];
}

#pragma mark - Configure TableCell

- (GZReplyCell *)configureTopicCellWithCell:(GZReplyCell *)cell IndexPath:(NSIndexPath *)indexpath {
    GZReplyModel *model = self.replayDataList.list[indexpath.row];
    
    cell.model = model;
    
    return cell;
}



@end
