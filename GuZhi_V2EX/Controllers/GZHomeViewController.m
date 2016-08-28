//
//  GZHomeViewController.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 8/14/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZHomeViewController.h"
#import "GZLeftMenuViewController.h"
#import "GZNodeModel.h"
#import "GZDataManager.h"
#import "GZTopicListCell.h"

#import "MJRefresh.h"
#import "MJRefreshHeader.h"
#import "MMDrawerController.h"
#import "UIViewController+MMDrawerController.h"

extern NSArray *__nodeArr;

@interface GZHomeViewController () <UITableViewDataSource, UITableViewDelegate, nodeSelectDelegate>
{
    /** cell 标题宽度 */
    CGFloat cellTitleWidth;
    
    /** 刷新头 */
    MJRefreshHeader *header;
    
    /** 页码 */
    NSInteger page;
    
    /** 父节点code */
    NSString *fatherNodeCode;
    
    /** 子节点code */
    NSString *childNodeCode;

    /** 子节点name */
    NSString *childNodeName;

    /** 子节点菜单背景view */
    UIView *nodeBGView;
    
    /** 子节点菜单背景开关按钮 */
    UIButton *childNodeButton;

    /** 子节点菜单table */
    UITableView *childNodeTable;

    /** 子节点对象数组 */
    NSArray *childNodeArr;
    
    /** 刷新的是否是子节点 */
    BOOL isRequestChildNode;

}
/** tableview */
//@property (strong, nonatomic) IBOutlet UITableView *mainTable;
@property (nonatomic, strong) UITableView *tableView;

/** headerView */
//@property (strong, nonatomic) IBOutlet UIView *headerView;

/** infoData */
@property (nonatomic, strong) NSMutableArray *articleDataArray;

@end

@implementation GZHomeViewController

#pragma mark - view的生命周期

- (void)loadView {
    [super loadView];
    
    NSLog(@"HomeViewController 进入 loadView=================");
    [self configureTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    /** 开启左滑 */
    [self.navigationController.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
}

- (void)viewWillDisappear:(BOOL)animated {
    /** 禁止左滑 */
    [self.navigationController.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
}

- (void)viewDidLoad {
    /** 默认刷新的不是子节点 */
    isRequestChildNode = NO;
    
    /** 页码 */
    page = 1;
    
    /** 默认父节点名字 */
    fatherNodeCode = @"all";
    
    /** 左边菜单遵守协议 */
    GZLeftMenuViewController *left = (GZLeftMenuViewController *)self.mm_drawerController.leftDrawerViewController;
    left.delegate = self;
    
    /** 默认父节点对象 */
#warning 为什么是9
    GZNodeObject *node = [__nodeArr objectAtIndex:9];
    
    /** 获取父节点对象的子节点对象数组 */
    childNodeArr = node.childNodeArray;
    
    /** 实例化子节点菜单 */
    [self initNodeBGView];
    
    cellTitleWidth = CGRectGetWidth([UIScreen mainScreen].bounds) - 32;
    
    // Nav menu
    childNodeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    [childNodeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    childNodeButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    childNodeButton.tag = 0;
    [childNodeButton addTarget:self action:@selector(childButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = childNodeButton;
    
    
    [super viewDidLoad];  // super前就做操作
    
//    [self initTable];
    [self initHeaderNavBtn];
    
    self.view.backgroundColor = [UIColor redColor];
    /** 初始化数据对象数据 */
    self.articleDataArray = [NSMutableArray array];
    
    /** 下拉刷新进此方法 */
    
    /** 开始刷新 */
    
    /** 上拉加载 */
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - configure view

//- (void)initTable {
//    self.mainTable.delegate = self;
//    self.mainTable.dataSource = self;
//    self.mainTable.separatorStyle = UITableViewCellSeparatorStyleNone;
//}

- (void)configureTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.000];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

- (void)initHeaderNavBtn {
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 33, 14)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"nav_menu_icon"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)initNodeBGView {
    NSLog(@"============= - (void)initNodeBGView 这个方法还没有写完啊 ================");
    NSLog(@"============= - (void)initNodeBGView 这个方法还没有写完啊 ================");
    NSLog(@"============= - (void)initNodeBGView 这个方法还没有写完啊 ================");
    NSLog(@"============= - (void)initNodeBGView 这个方法还没有写完啊 ================");
    NSLog(@"============= - (void)initNodeBGView 这个方法还没有写完啊 ================");
    NSLog(@"============= - (void)initNodeBGView 这个方法还没有写完啊 ================");
    NSLog(@"============= - (void)initNodeBGView 这个方法还没有写完啊 ================");
    NSLog(@"============= - (void)initNodeBGView 这个方法还没有写完啊 ================");
    NSLog(@"============= - (void)initNodeBGView 这个方法还没有写完啊 ================");
}


#pragma mark - get data
#warning node参数要处理好

- (void)loadData {
    [[GZDataManager shareManager] getNodeTopicListWithNodeId:nil
                                                    nodeName:@"qna"
                                                    userName:nil
                                                        page:page
                                                     success:^(NSArray *topicArray) {
                                                         NSLog(@"%@=============================", topicArray[0]);
                                                         [self.articleDataArray removeAllObjects];
                                                         [self.articleDataArray addObjectsFromArray:topicArray];
                                                         if (self.articleDataArray.count != 0) {
                                                            // [self.mainTable reloadData];
                                                         }
                                                         [header endRefreshing];
                                                         // footer已经被抛弃，新的用mj_footer
                                                         //[self.mainTable.mj_footer endRefreshing];
                                                     }
                                                     failure:^(NSError *error) {
                                                         NSLog(@"请求失败:%@", error);
//                                                         [header endRefreshing];
//                                                         [self.mainTable.mj_footer endRefreshing];
                                                     }];
}


#pragma mark - childMenuAction

- (void)childButtonAction:(UIButton *)sender {
    if (sender.tag == 0) {
        // 刷新子节点数据
        [childNodeTable reloadData];
        childNodeTable.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), childNodeArr.count*44);
        [UIView animateWithDuration:0.25 animations:^{
            nodeBGView.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), childNodeArr.count*44);
        }];
        sender.tag = 1;
    } else {
        [UIView animateWithDuration:0.25 animations:^{
            nodeBGView.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 0);
        } completion:^(BOOL finished) {
            childNodeTable.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 0);
        }];
        sender.tag = 0;
    }
}


#pragma mark - 抽屉效果

- (void)leftDrawerButtonPress:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


#pragma mark - table view
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 8;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
}

// 这段有毛用啊？！
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([tableView isEqual:childNodeTable]) {
        return 0;
    } else {
        return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"Cell";
    
    GZTopicListCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    return [self configureTopicCellWithCell:cell IndexPath:indexPath];
}

#pragma mark - Configure TableCell

- (GZTopicListCell *)configureTopicCellWithCell:(GZTopicListCell *)cell IndexPath:(NSIndexPath *)indexpath {
    GZTopicModel *model = self.articleDataArray[indexpath.row];
    
    cell.model = model;
    
    return cell;
}



@end
