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
#import <SDWebImage/UIImageView+WebCache.h>
#import "WBCircleDetialVC.h"

@interface WBCircleVC ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate,CircleDetialDelegate>

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) WBCircleHeaderView *header;

@property (strong, nonatomic) NSMutableArray *sourceArr;

@end

@implementation WBCircleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ZYWhite;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setUpNav];
    self.title = @"圈子";
    [self setUpViews];
}

- (void)viewWillAppear:(BOOL)animated {
    if ([userTokenTool isLogin] == YES) {
        self.header.icon.image = [UIImage imageWithData:[userTokenTool getIcon]];
    }else self.header.icon.image = [UIImage imageNamed:@"login"];
}

- (void)setUpViews {
    [self.view addSubview: self.table];
    self.table.tableHeaderView = self.header;
}

- (void)setUpNav {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"camera"] style:UIBarButtonItemStylePlain target:self action:@selector(cameraClick)];
}


- (void)cameraClick {
    if ([userTokenTool isLogin]) {
        [self alertSheet];
    }else {
        [SVProgressHUD showWithStatus:@"请先登录"];
    }
}

- (void)alertSheet {
        ZYSelf
        UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *cancelAct = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        UIAlertAction *playPhote = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf setPickerControllerWithSourceType:UIImagePickerControllerSourceTypeCamera];
        }];
        
        UIAlertAction *choses = [UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf setPickerControllerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }];
        
        [alertVC addAction:cancelAct];
        [alertVC addAction:playPhote];
        [alertVC addAction:choses];
        [self presentViewController:alertVC animated:YES completion:nil];

}

- (void)setPickerControllerWithSourceType:(UIImagePickerControllerSourceType)type {
    UIImagePickerController *pickerPlay = [[UIImagePickerController alloc] init];
    pickerPlay.sourceType = type;
    pickerPlay.allowsEditing = YES;
    pickerPlay.delegate = self;
    [self.navigationController presentViewController:pickerPlay animated:YES completion:nil];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *photo = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
   WBCircleDetialVC *detialVC = [[WBCircleDetialVC alloc] init];
    detialVC.photo = photo;
    detialVC.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:detialVC];
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        [self.navigationController presentViewController:nav animated:YES completion:nil];
    }];
}

- (void)cancelClick {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
    [cell setSourceWithSourceDict:self.sourceArr[indexPath.row]];
    return cell;
}


- (UITableView *)table {
    if (_table == nil) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.zy_width, self.view.zy_higth - 44)];
        _table.tableFooterView = [[UIView alloc] init];
        _table.dataSource = self;
        _table.delegate = self;
        [_table registerNib:[UINib nibWithNibName:NSStringFromClass([WBCircleCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];
        _table.estimatedRowHeight = 30;
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
        [_sourceArr addObject:@{@"icon":@"icon1",@"name":@"Lili",@"text":@"家里泰迪不听话，求解",@"photo":[NSNull null],@"commnt":@"Lee:泰迪淘气，天生的，只能忍"}];
        [_sourceArr addObject:@{@"icon":@"icon2",@"name":@"晴天",@"text":@"楼下的英短很漂亮，很想养，无奈不会挑选！",@"photo":[NSNull null],@"commnt":[NSNull null]}];
        [_sourceArr addObject:@{@"icon":@"icon3",@"name":@"果",@"text":@"阿呆的日常",@"photo":@"photo2",@"commnt":@"晴天：呆萌一只"}];
        [_sourceArr addObject:@{@"icon":@"icon4",@"name":@"Amy",@"text":@"每天打架的你们，还是很爱哟。乖",@"photo":@"photo3",@"commnt":@"Joyce：真可爱"}];
        [_sourceArr addObject:@{@"icon":@"icon5",@"name":@"Lee",@"text":@"女朋友生日，送一只喵给她好了",@"photo":@"photo1",@"commnt":@"Joyce:虽然很可爱，确定有YSL有用？😏"}];
        [_sourceArr addObject:@{@"icon":@"icon6",@"name":@"Joyce",@"text":@"今天天气不错，带上小汤圆，去旅行~汤圆是一直猫，哈哈",@"photo":@"",@"commnt":@"Lee：求同行"}];
    }
    return _sourceArr;
}

@end
