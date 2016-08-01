//
//  GZDetailTopicViewController.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/31/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZDetailTopicViewController.h"
#import "GZHotModel.h"

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
    
    // 回复
    NSArray      *replayDataArray;
    
    CGFloat      cellContentWith;
}

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
    
    
    title = [[UILabel alloc] init];
    title.textColor = [UIColor blueColor];
    title.font = dataFont;
    title.numberOfLines = 0;
    title.frame = CGRectMake(8, 10, titleSize.width, titleSize.height);
    title.text = self.info.title;
    [headerView addSubview:title];
   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}



@end
