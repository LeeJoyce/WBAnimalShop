//
//  WBCircleVC.m
//  animalShop
//
//  Created by JOY on 17/5/15.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "WBCircleVC.h"
#import "WBCircleHeaderView.h"
#import "WBCircleCell.h"

@interface WBCircleVC ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) WBCircleHeaderView *header;

@property (strong, nonatomic) NSMutableArray *sourceArr;

@end

@implementation WBCircleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ZYWhite;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"圈子";
    [self setUpViews];
}

- (void)setUpViews {
    [self.view addSubview: self.table];
    self.table.tableHeaderView = self.header;
}

- (void)viewWillAppear:(BOOL)animated {
    if ([userTokenTool isLogin] == YES) {
        self.header.icon.image = [UIImage imageWithData:[userTokenTool getIcon]];
    }else self.header.icon.image = [UIImage imageNamed:@"login"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([userTokenTool isLogin] == YES) {
        return self.sourceArr.count;
    }else return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WBCircleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}


- (UITableView *)table {
    if (_table == nil) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.zy_width, self.view.zy_higth - 44)];
        _table.tableFooterView = [[UIView alloc] init];
        _table.dataSource = self;
        _table.delegate = self;
        [_table registerNib:[UINib nibWithNibName:NSStringFromClass([WBCircleCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];
        _table.rowHeight = 150;
    }
    return _table;
}

- (WBCircleHeaderView *)header {
    if (_header == nil) {
        _header = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([WBCircleHeaderView class])owner:nil options:nil].firstObject;
        _header.zy_higth = 0.4 * self.view.zy_higth;
    }
    return _header;
}

- (NSMutableArray *)sourceArr {
    if (_sourceArr == nil) {
        _sourceArr = [NSMutableArray array];
        [_sourceArr addObject:@{@"icon":@"",@"name":@""}];
        [_sourceArr addObject:@{@"icon":@"",@"name":@""}];
        [_sourceArr addObject:@{@"icon":@"",@"name":@""}];
        [_sourceArr addObject:@{@"icon":@"",@"name":@""}];
        [_sourceArr addObject:@{@"icon":@"",@"name":@""}];
    }
    return _sourceArr;
}

@end
