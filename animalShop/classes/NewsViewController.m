//
//  NewsViewController.m
//  移动掌控
//
//  Created by Shuangwutech on 16/1/19.
//  Copyright © 2016年 Shuangwutech. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCell.h"
#import "DetailController.h"


@interface NewsViewController ()
/** 消息cell  */
@property (nonatomic, strong) NewsCell *Cell;
/** 消息个数 */
@property (nonatomic, assign) NSInteger number;
@end

@implementation NewsViewController

#pragma mark - 初始化
- (void)viewDidLoad
{
    [super viewDidLoad];
    //导航栏标题
    self.navigationItem.title = @"消息";
    
    //初始化tableView
    [self setupTableView];
    
    [self setBadgeValue];
}

- (void)setupTableView
{
    self.tableView.rowHeight = self.view.zy_higth * 0.1;
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:@"newCell"];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 刷新
//    self.tableView.mj_header = [Header headerWithRefreshingTarget:self refreshingAction:@selector(loadNews)];
//    self.tableView.mj_footer = [Footer footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreNews)];
    
}

#pragma mark - request
- (void)loadNews{
    NSLog(@"模拟请求");
}

-(void)loadMoreNews{
    NSLog(@"模拟请求");
}

#pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"newCell"];
    [cell setUpLocalSourceWithIndex:indexPath];
    return cell;
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //标记消息成已读(在消息未读的前提下)
    NewsCell *selectCell = [tableView cellForRowAtIndexPath:indexPath];
    selectCell.attentionRed.hidden = YES;
    [self setBadgeValue];
    
    //跳转到消息详情页面
    DetailController *detail = [[DetailController alloc] init];
    detail.titleText = selectCell.titleLabel.text;
    detail.contentText = selectCell.detailLabel.text;
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

#pragma mark - 设置角标
- (void)setBadgeValue
{
    NSInteger unreadNumber = 0;
    for (NewsCell *cell in self.tableView.visibleCells) {
        if (cell.attentionRed.hidden == NO) {
            unreadNumber += 1;
        }
    }
    
    if (unreadNumber > 0) {
        self.navigationController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%zd", unreadNumber];
        [UIApplication sharedApplication].applicationIconBadgeNumber = unreadNumber;
    } else {
         self.navigationController.tabBarItem.badgeValue = nil;
         [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    }
}

//支持竖屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

//修改分割线
- (void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - 可编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        
        
        tableView.editing = NO;
        NSLog(@"要删除我的话  需要更新数据源哦 王小姐~~~ 你会么???");
        
    }];
    delete.backgroundColor = [UIColor redColor];
    return @[delete];
    
}


@end
