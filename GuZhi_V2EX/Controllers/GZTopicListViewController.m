//
//  GZTopicListViewController.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/27/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//


#import "GZTopicListViewController.h"
#import "GZDetailTopicViewController.h"
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


#pragma mark - Configure

- (void)configureUI {
    self.title = @"最热";
    self.view.backgroundColor = [UIColor redColor];
    
    }

- (void)configureRefresh {

    // 下拉刷新
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        
        [self updateHotData];
        
        [self.tableView.mj_header endRefreshing];
    }];
    
//    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self
//                                                          refreshingAction:@selector(updateHotData)];

    
    // 设置自动切换透明度（在导航栏下面自动隐藏）
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    // 上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self updateHotData];
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
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
//    NSLog(@"%@", [self.hotList.list[0] valueForKey:@"id"]);
}


#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"TODETAIL"]) {
        GZDetailTopicViewController *detailVC = [segue destinationViewController];
        
        NSLog(@"%@",[self.hotList.list[self.tableView.indexPathForSelectedRow.row] class]);
        // 传选中的model过去
        detailVC.info = self.hotList.list[self.tableView.indexPathForSelectedRow.row];
    }
}

#pragma mark - Table view delagate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.hotList.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"hot table view");
    GZTopicListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    return [self configureTopicCellWithCell:cell IndexPath:indexPath];
}

#pragma mark - Configure TableCell

- (GZTopicListCell *)configureTopicCellWithCell:(GZTopicListCell *)cell IndexPath:(NSIndexPath *)indexpath {
    
    GZHotModel *model = self.hotList.list[indexpath.row];
    
    cell.model = model;
    
    return cell;
}

@end
