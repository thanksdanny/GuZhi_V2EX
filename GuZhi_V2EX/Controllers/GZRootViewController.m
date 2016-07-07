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
@property NSURLSession *session;
@property NSMutableDictionary *hotTitle;

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

# pragma mark - 获取网络数据

// 获取hot https://www.v2ex.com/api/topics/hot.json
- (void)fetchHotListData {
    NSURL *hotURL = [NSURL URLWithString:@"https://www.v2ex.com/api/topics/hot.json"];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:hotURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        self.hotList = json;
        self.hotTitle = [NSMutableDictionary dictionary];
        for (int i = 0; i < self.hotList.count; i++) {
//            [self.hotTitle setObject:self.hotList[i] forKey:@"title"];
            NSLog(@"%@", self.hotList);
        }
        
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
