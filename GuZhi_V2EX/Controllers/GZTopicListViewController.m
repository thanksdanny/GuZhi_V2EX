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

@interface GZTopicListViewController ()

@property (nonatomic, strong) GZDataManager *dataManager;

@end

@implementation GZTopicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataManager getHotTopicsSuccess:^(NSArray *list) {
        NSLog(@"hahah");
    } failed:^(NSError *error) {
        NSLog(@"失败咯");
    }];
}

- (void)configureUI {
    self.title = @"最热";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GZTopicListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //    cell.titleLable.text = self.hotTitle[indexPath.row];
    cell.titleLable.text = @"今晚究竟吃d咩啊";
    
    return cell;
}



@end
