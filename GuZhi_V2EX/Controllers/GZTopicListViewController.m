//
//  GZTopicListViewController.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//


#import "GZTopicListViewController.h"
#import "GZTopicListCell.h"
#import "GZDataManager.h"
#import "GZHotModel.h"
#import "MJRefresh.h"

@interface GZTopicListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) GZHotList *hotList;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation GZTopicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
    [self configureRefresh];
    
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.tableView.mj_header beginRefreshing];
//}


#pragma mark - Configure

- (void)configureUI {
    self.title = @"最热";
    self.view.backgroundColor = [UIColor redColor];
    
    
    
}

- (void)configureRefresh {
    
    __unsafe_unretained UITableView *tableView = self.tableView;
    
    // 下拉刷新
    tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        
        [self updateHotData];
        
        [tableView.mj_header endRefreshing];
    }];
    
    // 设置自动切换透明度（在导航栏下面自动隐藏）
    tableView.mj_header.automaticallyChangeAlpha = YES;
    
    // 上拉刷新
    tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self updateHotData];
        // 结束刷新
        [tableView.mj_footer endRefreshing];
    }];
}


#pragma mark - Data

- (void)setHotList:(GZHotList *)hotList {
    _hotList = hotList;
    
    [self.tableView reloadData];
}

- (void)updateHotData {
    // 首页获取数据
    [[GZDataManager shareManager] getHotTopicsSuccess:^(GZHotList *list) {
        NSLog(@"请求hotlist成功");
        self.hotList = list;
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}


#pragma mark - Table view delagate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.hotList.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GZTopicListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //    cell.titleLable.text = self.hotTitle[indexPath.row];
//    cell.titleLable.text = @"今晚究竟吃d咩啊";
    
    return [self configureTopicCellWithCell:cell IndexPath:indexPath];
}

#pragma mark - Configure TableCell

- (GZTopicListCell *)configureTopicCellWithCell:(GZTopicListCell *)cell IndexPath:(NSIndexPath *)indexpath {
    
    GZHotModel *model = self.hotList.list[indexpath.row];
    
    cell.model = model;
    
    return cell;
}

@end
