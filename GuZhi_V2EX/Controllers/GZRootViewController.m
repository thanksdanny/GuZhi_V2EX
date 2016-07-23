//
//  GZRootViewController.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 7/6/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

/*
 思路：
 1、解析出json，存进plist
 2、转进模型
 
 */


#import "GZRootViewController.h"
#import "GZTopicListCell.h"
#import "HotModel.h"

@interface GZRootViewController ()

{
    // 取程序沙盒地址
    NSString *docPath;
}

@property (nonatomic, strong) NSMutableArray *hotList;
@property NSURLSession *session;


@end

@implementation GZRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 生成session
    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // 沙盒地址
    docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@", docPath);
    

    // 获取数据
    [self fetchHotListData];
//    [self setupDataSource];
    
    // 配置UI
    [self configureUI];
    
}

# pragma mark - 懒加载

- (NSArray *)hotList {
    if (!_hotList) {
        _hotList = [NSMutableArray array];
    }
    return _hotList;
}

# pragma mark - ConfigureUI

- (void)configureUI {
    self.title = @"最新";
}


# pragma mark - 获取网络数据

// 获取hot https://www.v2ex.com/api/topics/hot.json
- (void)fetchHotListData {
    NSURL *hotURL = [NSURL URLWithString:@"https://www.v2ex.com/api/topics/hot.json"];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:hotURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 解析json
        NSArray *hotArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        // 取json数组中的字典，创建model
        for (int i = 0; i < hotArray.count; i++) {
            NSDictionary *dict = hotArray[i];
            // 创建error，调试用
            NSError *err = nil;
            HotModel *hotModel = [MTLJSONAdapter modelOfClass:[HotModel class] fromJSONDictionary:dict error:&err];
            [self.hotList addObject:hotModel];
        }
        NSLog(@"=============begin==============");
        NSLog(@"%@",self.hotList);
        // 存储到plist
//        [self.hotList writeToFile:[docPath stringByAppendingPathComponent:@"HotData.plist"] atomically:YES];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
    
    
    [dataTask resume];
}


//- (void)setupDataSource {
//    if ([[NSFileManager defaultManager] fileExistsAtPath:[docPath stringByAppendingPathComponent:@"HotData.plist"]]) {
//        NSLog(@"有HotList.plist");
//        self.hotList = [NSArray arrayWithContentsOfFile:[docPath stringByAppendingPathComponent:@"HotData.plist"]];
//    } else {
//        NSLog(@"没hotlist");
//        [self fetchHotListData];
//    }
//}

# pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.hotList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GZTopicListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    cell.titleLable.text = self.hotTitle[indexPath.row];
    cell.titleLable.text = @"test";
    
    
    return cell;
}



@end
