//
//  GZRootViewController.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/6/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZRootViewController.h"
#import "GZTopicListCell.h"

@interface GZRootViewController ()

@property (nonatomic, strong) NSArray *hotList;
@property (nonatomic)  NSMutableArray *hotTitle;
@property NSURLSession *session;

@end

@implementation GZRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 生成session
    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [self fetchHotListData];
    
    // 配置UI
    [self configureUI];
}

# pragma mark - ConfigureUI

- (void)configureUI {
    self.title = @"最新";
}

# pragma mark - 懒加载

- (NSArray *)hotTitle {
    if (!_hotTitle) {
        _hotTitle = [NSMutableArray array];
    }
    return _hotTitle;
}

# pragma mark - 获取网络数据

// 获取hot https://www.v2ex.com/api/topics/hot.json
- (void)fetchHotListData {
    NSURL *hotURL = [NSURL URLWithString:@"https://www.v2ex.com/api/topics/hot.json"];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:hotURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 解析json
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.hotList = json;
        
//        for (int i = 0; i < self.hotList.count; i++) {
//            NSString *title = [self.hotList[i] objectForKey:@"title"];
////            NSLog(@"%@", title);
//            [self.hotTitle addObject:title];
//        }
        
        NSLog(@"%@", self.hotTitle);
    }];
    
    
    [dataTask resume];
}

# pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GZTopicListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.titleLable.text = @"今晚吃d咩啊";
    
    
    return cell;
}



@end
