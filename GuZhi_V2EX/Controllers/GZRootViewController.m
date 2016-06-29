//
//  GZRootViewController.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 6/30/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZRootViewController.h"
#import "GZTopicListCell.h"

@interface GZRootViewController ()

@end

@implementation GZRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


# pragma mark - tableview data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100; // 到时根据数据源修改
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GZTopicListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.nameLabel.text = @"hahaha";
    
    return cell;
}
@end
