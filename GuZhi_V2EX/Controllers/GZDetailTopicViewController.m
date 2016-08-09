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
#import "GZTopicModel.h"
#import "GZNodeModel.h"
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
    
    CGFloat      cellContentWidth;
}

// 回复
@property (nonatomic, strong) GZReplyList *replyDataList;

@end

@implementation GZDetailTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
    [self initTable];
    [self getReplyData];
    [self getTopicData];
    
}


#pragma mark - configure

- (void)initTable {
    detailTable.delegate = self;
    detailTable.dataSource = self;
    
    headerView.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), bottomLine.frame.origin.y + 2);
    headerView.backgroundColor = [UIColor whiteColor];
}

- (void)configureUI {
    cellContentWidth = [UIScreen mainScreen].bounds.size.width - 69; // 为啥69
    
    self.title = @"主题详情";
    
    headerView = [[UIView alloc] init];
    headerView.clipsToBounds = YES; // clipsToBounds:如果子视图的范围超出了父视图的边界，那么超出的部分就会被裁剪掉。
    
    NSString *dataString = self.info.title;
    UIFont *dataFont = [UIFont systemFontOfSize:14];
    CGSize titleSize = [dataString boundingRectWithSize:CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 54, 400)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:dataFont}
                                                context:nil].size;
    
    // 标题lable
    title = [[UILabel alloc] init];
    title.textColor = [UIColor colorWithRed:79.0/255.0 green:79.0/255.0 blue:79.0/255.0 alpha:1];
    title.font = dataFont;
    title.numberOfLines = 0;
    title.frame = CGRectMake(8, 10, titleSize.width, titleSize.height);
    title.text = self.info.title;
    [headerView addSubview:title];
    
    // 头像
    userAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 38, 8, 30, 30)];
    userAvatar.backgroundColor = [UIColor blackColor];
    userAvatar.layer.cornerRadius = 3;
    userAvatar.layer.masksToBounds = YES;
    [userAvatar sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https:%@", [self.info.member valueForKey:@"avatar_mini"]]]
                  placeholderImage:[UIImage imageNamed:@"avatar_plasehoder"]];

    [headerView addSubview:userAvatar];
    
    // tag lable
    CGFloat uTagx = title.frame.size.height<17?title.frame.size.height+30:title.frame.size.height+13;
    UILabel *uTag = [[UILabel alloc] initWithFrame:CGRectMake(8, uTagx, 20, 30)];
    uTag.text = @"By";
    uTag.font = [UIFont systemFontOfSize:13];
    uTag.textColor = [UIColor grayColor];
    [headerView addSubview:uTag];
    
    // 楼主label
    userName = [[UILabel alloc] init];
    UIFont *nameFont = [UIFont boldSystemFontOfSize:12];
    NSString *usernameStr = [self.info.member valueForKey:@"username"];
    CGSize nameSize = [usernameStr boundingRectWithSize:CGSizeMake(100, 20)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:nameFont}
                                                context:nil].size;
    userName.font = nameFont;
    userName.numberOfLines = 0;
    userName.textColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:1];
    userName.frame = CGRectMake(28, uTag.frame.origin.y, nameSize.width, 20);
    userName.text = usernameStr;
    [headerView addSubview:userName];
    
    
#warning 回复数往后再加
    replaceCount = [[UILabel alloc] init];
    UIFont *countFont = [UIFont systemFontOfSize:13];
    
    
    // node节点
    nodeName = [[UILabel alloc] init];
    UIFont *nodeFont = [UIFont systemFontOfSize:13];
    NSString *nodeNameStr = [self.info.node valueForKey:@"name"];
    CGSize nodeSize = [nodeNameStr boundingRectWithSize:CGSizeMake(100, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:nodeFont} context:nil].size;
    nodeName.font = nameFont;
    nodeName.numberOfLines = 0;
    nodeName.textColor = [UIColor whiteColor];
    nodeName.backgroundColor = [UIColor lightGrayColor];
    nodeName.textAlignment = NSTextAlignmentCenter;
    nodeName.layer.cornerRadius = 3;
    nodeName.layer.masksToBounds = YES;
    nodeName.frame = CGRectMake(replaceCount.frame.origin.x+replaceCount.frame.size.width+8, uTag.frame.origin.y, nodeSize.width+4, 20);
    nodeName.text = nodeNameStr;
    [headerView addSubview:nodeName];
    
    
#warning 时间戳
    timeLabel = [[UILabel alloc] init];
    
    // 底部线条
    bottomLine = [[UILabel alloc] init];
    bottomLine.frame = CGRectMake(8, uTag.frame.origin.y+26, CGRectGetWidth([UIScreen mainScreen].bounds)-16, 0.5);
    bottomLine.backgroundColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1];
    [headerView addSubview:bottomLine];
    
    // 内容
    articleLabel = [[UITextView alloc] init];
    [headerView addSubview:articleLabel];
}

- (void)getTopicData {
    // 获取主题详情数据 r
    NSLog(@"主题详情请求开始");
    [[GZDataManager shareManager] getTopicWithTopicId:self.info.id success:^(GZTopicModel *model) {
        NSLog(@"成功读取主题详情");
        content = model.content;
        
        UIFont *countFont = [UIFont systemFontOfSize:14];
        CGSize countSize = [content boundingRectWithSize:CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 16, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:countFont} context:nil].size;
        articleLabel.font = countFont;
        articleLabel.editable = NO;
        articleLabel.scrollEnabled = NO;
        articleLabel.textColor = [UIColor grayColor];
        articleLabel.frame = CGRectMake(8, userName.frame.origin.y+33, CGRectGetWidth([UIScreen mainScreen].bounds) - 16, countSize.height + 40);
        articleLabel.text = content;
        headerView.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), articleLabel.frame.origin.y + articleLabel.frame.size.height);
        
        
        [detailTable reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    NSLog(@"结束");

}

- (void)getReplyData {
    // 获取回复详情数据
    NSLog(@"请求回复开始");
    [[GZDataManager shareManager] getRepliesWithTopicId:self.info.id success:^(GZReplyList *list) {
        self.replyDataList = list;
        [detailTable reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    GZReplyModel *obj = [self.replyDataList.list objectAtIndex:indexPath.row];
    UIFont *countFont = [UIFont systemFontOfSize:14];
    CGSize countSize = [obj.content boundingRectWithSize:CGSizeMake(cellContentWidth, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:countFont} context:nil].size;
    
    return countSize.height + 50;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return headerView.frame.size.height;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.replyDataList.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GZReplyCell *replaycell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!replaycell) {
        replaycell= [[GZReplyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    GZReplyModel *replyObject = self.replyDataList.list[indexPath.row];
    UIFont *countFont = [UIFont systemFontOfSize:14];
    CGSize countSize = [replyObject.content boundingRectWithSize:CGSizeMake(cellContentWidth, 10000)
                                                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                                                     attributes:@{NSFontAttributeName: countFont}
                                                                                        context:nil].size;
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(58, 40, cellContentWidth - 8, countSize.height)];
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.text = replyObject.content;
    contentLabel.numberOfLines = 0;
    contentLabel.textColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:1];
    [replaycell.contentView addSubview:contentLabel];
    
    
    
    return [self configureTopicCellWithCell:replaycell IndexPath:indexPath];
}

#pragma mark - Configure TableCell

- (GZReplyCell *)configureTopicCellWithCell:(GZReplyCell *)cell IndexPath:(NSIndexPath *)indexpath {
    GZReplyModel *model = self.replyDataList.list[indexpath.row];
    
    cell.model = model;
    
    return cell;
}






@end
