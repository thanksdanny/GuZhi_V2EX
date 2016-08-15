//
//  GZLeftMenuViewController.m
//  GuZhi_V2EX
//
//  Created by Danny Ho on 8/14/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "GZLeftMenuViewController.h"
#import "GZNodeModel.h"

NSArray *__nodeArr;

@interface GZLeftMenuViewController () <UITableViewDelegate, UITableViewDataSource>

{
    IBOutlet UITableView *nodeTable;
    IBOutlet UIView *headerView;
}
@end

@implementation GZLeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initTable];
}

#pragma mark - configure data

- (void)initTable {
    nodeTable.delegate = self;
    nodeTable.dataSource = self;
    nodeTable.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)initData {
    GZNodeObject *nodeJS  = [[GZNodeObject alloc] initWithNodeName:@"技术" NodeCode:@"tect"];
    GZChildNodeObject *cn1 = [[GZChildNodeObject alloc] initWithChildNodeName:@"程序员" CNode:@"programmer"];
    GZChildNodeObject *cn2 = [[GZChildNodeObject alloc] initWithChildNodeName:@"Python" CNode:@"python"];
    GZChildNodeObject *cn3 = [[GZChildNodeObject alloc] initWithChildNodeName:@"iDev" CNode:@"idev"];
    GZChildNodeObject *cn4 = [[GZChildNodeObject alloc] initWithChildNodeName:@"Android" CNode:@"android"];
    GZChildNodeObject *cn5 = [[GZChildNodeObject alloc] initWithChildNodeName:@"Linux" CNode:@"linux"];
    GZChildNodeObject *cn6 = [[GZChildNodeObject alloc] initWithChildNodeName:@"node.js" CNode:@"nodejs"];
    GZChildNodeObject *cn7 = [[GZChildNodeObject alloc] initWithChildNodeName:@"云计算" CNode:@"cloud"];
    GZChildNodeObject *cn8 = [[GZChildNodeObject alloc] initWithChildNodeName:@"宽带症候群" CNode:@"bb"];
    NSArray *JSarr = @[cn1,cn2,cn3,cn4,cn5,cn6,cn7,cn8];
    nodeJS.childNodeArray = JSarr;
    
    GZNodeObject *nodeCY  = [[GZNodeObject alloc] initWithNodeName:@"创意" NodeCode:@"creative"];
    GZChildNodeObject *cy1 = [[GZChildNodeObject alloc] initWithChildNodeName:@"分享创造" CNode:@"create"];
    GZChildNodeObject *cy2 = [[GZChildNodeObject alloc] initWithChildNodeName:@"设计" CNode:@"design"];
    GZChildNodeObject *cy3 = [[GZChildNodeObject alloc] initWithChildNodeName:@"奇思妙想" CNode:@"ideas"];
    NSArray *CYarr = @[cy1,cy2,cy3];
    nodeCY.childNodeArray = CYarr;
    
    GZNodeObject *nodeHW  = [[GZNodeObject alloc] initWithNodeName:@"好玩" NodeCode:@"play"];
    GZChildNodeObject *hw1 = [[GZChildNodeObject alloc] initWithChildNodeName:@"分享发现" CNode:@"share"];
    GZChildNodeObject *hw2 = [[GZChildNodeObject alloc] initWithChildNodeName:@"电子游戏" CNode:@"games"];
    GZChildNodeObject *hw3 = [[GZChildNodeObject alloc] initWithChildNodeName:@"电影" CNode:@"movie"];
    GZChildNodeObject *hw4 = [[GZChildNodeObject alloc] initWithChildNodeName:@"剧集" CNode:@"tv"];
    GZChildNodeObject *hw5 = [[GZChildNodeObject alloc] initWithChildNodeName:@"音乐" CNode:@"music"];
    GZChildNodeObject *hw6 = [[GZChildNodeObject alloc] initWithChildNodeName:@"旅游" CNode:@"travel"];
    GZChildNodeObject *hw7 = [[GZChildNodeObject alloc] initWithChildNodeName:@"Android" CNode:@"android"];
    GZChildNodeObject *hw8 = [[GZChildNodeObject alloc] initWithChildNodeName:@"午夜俱乐部" CNode:@"afterdark"];
    NSArray *HWarr = @[hw1,hw2,hw3,hw4,hw5,hw6,hw7,hw8];
    nodeHW.childNodeArray = HWarr;
    
    GZNodeObject *nodeAP  = [[GZNodeObject alloc] initWithNodeName:@"Apple" NodeCode:@"apple"];
    GZChildNodeObject *AP1 = [[GZChildNodeObject alloc] initWithChildNodeName:@"Mac OS X" CNode:@"macosx"];
    GZChildNodeObject *AP2 = [[GZChildNodeObject alloc] initWithChildNodeName:@"iPhone" CNode:@"iphone"];
    GZChildNodeObject *AP3 = [[GZChildNodeObject alloc] initWithChildNodeName:@"iPad" CNode:@"ipad"];
    GZChildNodeObject *AP4 = [[GZChildNodeObject alloc] initWithChildNodeName:@"MBP" CNode:@"mbp"];
    GZChildNodeObject *AP5 = [[GZChildNodeObject alloc] initWithChildNodeName:@"iMac" CNode:@"imac"];
    GZChildNodeObject *AP6 = [[GZChildNodeObject alloc] initWithChildNodeName:@"Apple" CNode:@"apple"];
    NSArray *AParr = @[AP1,AP2,AP3,AP4,AP5,AP6];
    nodeAP.childNodeArray = AParr;
    
    GZNodeObject *nodeKGZ = [[GZNodeObject alloc] initWithNodeName:@"酷工作" NodeCode:@"jobs"];
    GZChildNodeObject *kgz1 = [[GZChildNodeObject alloc] initWithChildNodeName:@"酷工作" CNode:@"jobs"];
    GZChildNodeObject *kgz2 = [[GZChildNodeObject alloc] initWithChildNodeName:@"求职" CNode:@"cv"];
    GZChildNodeObject *kgz3 = [[GZChildNodeObject alloc] initWithChildNodeName:@"外包" CNode:@"outsourcing"];
    NSArray *KGZarr = @[kgz1,kgz2,kgz3];
    nodeKGZ.childNodeArray = KGZarr;
    
    GZNodeObject *nodeJY  = [[GZNodeObject alloc] initWithNodeName:@"交易" NodeCode:@"deals"];
    GZChildNodeObject *jy1 = [[GZChildNodeObject alloc] initWithChildNodeName:@"二手交易" CNode:@"all4all"];
    GZChildNodeObject *jy2 = [[GZChildNodeObject alloc] initWithChildNodeName:@"物物交换" CNode:@"exchange"];
    GZChildNodeObject *jy3 = [[GZChildNodeObject alloc] initWithChildNodeName:@"免费赠送" CNode:@"free"];
    GZChildNodeObject *jy4 = [[GZChildNodeObject alloc] initWithChildNodeName:@"域名" CNode:@"dn"];
    GZChildNodeObject *jy5 = [[GZChildNodeObject alloc] initWithChildNodeName:@"团购" CNode:@"tuan"];
    NSArray *JYarr = @[jy1,jy2,jy3,jy4,jy5];
    nodeJY.childNodeArray = JYarr;
    
    GZNodeObject *nodeCS  = [[GZNodeObject alloc] initWithNodeName:@"城市" NodeCode:@"city"];
    GZChildNodeObject *cs1 = [[GZChildNodeObject alloc] initWithChildNodeName:@"北京" CNode:@"beijing"];
    GZChildNodeObject *cs2 = [[GZChildNodeObject alloc] initWithChildNodeName:@"上海" CNode:@"shanghai"];
    GZChildNodeObject *cs3 = [[GZChildNodeObject alloc] initWithChildNodeName:@"深圳" CNode:@"shenzhen"];
    GZChildNodeObject *cs4 = [[GZChildNodeObject alloc] initWithChildNodeName:@"广州" CNode:@"guangzhou"];
    GZChildNodeObject *cs5 = [[GZChildNodeObject alloc] initWithChildNodeName:@"杭州" CNode:@"hangzhou"];
    GZChildNodeObject *cs6 = [[GZChildNodeObject alloc] initWithChildNodeName:@"成都" CNode:@"chengdu"];
    GZChildNodeObject *cs7 = [[GZChildNodeObject alloc] initWithChildNodeName:@"昆明" CNode:@"kunming"];
    GZChildNodeObject *cs8 = [[GZChildNodeObject alloc] initWithChildNodeName:@"纽约" CNode:@"nyc"];
    GZChildNodeObject *cs9 = [[GZChildNodeObject alloc] initWithChildNodeName:@"洛杉矶" CNode:@"la"];
    NSArray *CSarr = @[cs1,cs2,cs3,cs4,cs5,cs6,cs7,cs8,cs9];
    nodeCS.childNodeArray = CSarr;
    
    GZNodeObject *nodeWD  = [[GZNodeObject alloc] initWithNodeName:@"问与答" NodeCode:@"qna"];
    GZChildNodeObject *wd1 = [[GZChildNodeObject alloc] initWithChildNodeName:@"问与答" CNode:@"qna"];
    NSArray *WDarr = @[wd1];
    nodeWD.childNodeArray = WDarr;
    
    
    GZNodeObject *nodeHOT = [[GZNodeObject alloc] initWithNodeName:@"最热" NodeCode:@"hot"];
    nodeHOT.childNodeArray = [NSArray new];
    
    GZNodeObject *nodeALL = [[GZNodeObject alloc] initWithNodeName:@"全部" NodeCode:@"all"];
    nodeALL.childNodeArray = [NSArray new];
    
    GZNodeObject *nodeR2  = [[GZNodeObject alloc] initWithNodeName:@"R2" NodeCode:@"r2"];
    nodeR2.childNodeArray = [NSArray new];
    
    __nodeArr = @[nodeJS,nodeCY,nodeHW,nodeAP,nodeKGZ,nodeJY,nodeCS,nodeWD,nodeHOT,nodeALL,nodeR2];
}

#pragma mark - table

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 64;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return __nodeArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.backgroundColor = nodeTable.backgroundColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    GZNodeObject *node = [__nodeArr objectAtIndex:indexPath.row];
    cell.textLabel.text = node.nodeName;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GZNodeObject *node = [__nodeArr objectAtIndex:indexPath.row];
    [self.delegate nodeSelectAtIndex:node.nodeCode Name:node.nodeCode Index:indexPath.row];
}

@end
