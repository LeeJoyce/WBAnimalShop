//
//  DogViewController.m
//  animalShop
//
//  Created by wangzhongyi on 17/5/17.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "DogViewController.h"
#import "AnimalModel.h"
#import "AnimalKindsCell.h"
#import "DetailController.h"
@interface DogViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray <AnimalModel *>*dogArray;
@end

@implementation DogViewController

static NSString * animalCellID = @"animalCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"宠物狗";
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"json" ofType:@"txt"];
    NSError *error = nil;
    NSString *jsonStr = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    
    //字典转模型
    self.dogArray = [AnimalModel mj_objectArrayWithKeyValuesArray:array];
    
    [self setupTableView];
    
}

- (void)setupTableView
{
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    self.tableView.rowHeight = 100;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"AnimalKindsCell" bundle:nil] forCellReuseIdentifier:animalCellID];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dogArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimalKindsCell *cell = [tableView dequeueReusableCellWithIdentifier:animalCellID];
    cell.model = self.dogArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailController *detail = [[DetailController alloc] init];
    AnimalModel *model = self.dogArray[indexPath.row];
    detail.titleText = model.name;
    detail.contentText = model.detail;
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - lazy
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}


@end
