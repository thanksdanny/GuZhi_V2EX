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

@interface GZTopicListViewController ()

@property (nonatomic, strong) GZHotList *hotList;


@end

@implementation GZTopicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
    
    [[GZDataManager shareManager] getHotTopicsSuccess:^(GZHotList *list) {
        NSLog(@"请求hotlist成功");
        self.hotList = list;
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

//- (id)test {
//    return [[GZDataManager shareManager] getHotTopicsSuccess:^(GZHotList *list) {
//        NSLog(@"%@", list);
//    } failure:^(NSError *error) {
//        NSLog(@"lol");
//    }];
//}


#pragma mark - Configure

- (void)configureUI {
    self.title = @"最热";
}


#pragma mark - Data

- (void)setHotList:(GZHotList *)hotList {
    _hotList = hotList;
    
    [self.tableView reloadData];
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
