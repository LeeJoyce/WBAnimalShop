//
//  WBMineVC.m
//  animalShop
//
//  Created by JOY on 17/5/15.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "WBMineVC.h"
#import "WBEditCell.h"
#import "WBLoginBtn.h"
#import "LoginViewC.h"
#import "registeVC.h"

@interface WBMineVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet  WBLoginBtn *regisOrLogin;
@property (weak, nonatomic) IBOutlet WBLoginBtn *regisBtn;

@property (weak, nonatomic) IBOutlet UIButton *userIcon;
@property (strong, nonatomic) UITableView *table;

@property (strong, nonatomic) NSMutableArray *userInfoArr;
@end

@implementation WBMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    [self setUpIcon];
    [self.view addSubview:self.table];
    [self setBtn];
}

- (void)viewWillAppear:(BOOL)animated {
    [self setUpViewsWithIsLogined];
}

- (void)setBtn {
    [self.regisBtn addTarget:self action:@selector(regisClick) forControlEvents:UIControlEventTouchUpInside];
    [self.regisOrLogin addTarget:self action:@selector(loginClcik) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setUpViewsWithIsLogined {
    if ([userTokenTool isLogin] == YES) {
        [self.userIcon setImage:[UIImage imageWithData:[userTokenTool getIcon]] forState:UIControlStateNormal];
        self.regisBtn.hidden = YES;
        [self.regisOrLogin setTitle:@"注销" forState:UIControlStateNormal];
        self.userIcon.enabled = YES;
        [self.view addSubview:self.table];
    }else {
        self.regisBtn.hidden = NO;
        [self.userIcon setImage:[UIImage imageNamed:@"login"] forState:UIControlStateNormal];
        [self.regisOrLogin setTitle:@"登录" forState:UIControlStateNormal];
        self.userIcon.enabled = NO;
        [self.table removeFromSuperview];
    }
}

- (void)setUpIcon {
    self.userIcon.highlighted = NO;
    self.userIcon.layer.cornerRadius = self.userIcon.zy_width * 0.5;
    self.userIcon.layer.borderWidth = 1;
    self.userIcon.layer.borderColor = ZYGray(120).CGColor;
    self.userIcon.layer.masksToBounds = YES;
    [self.userIcon addTarget:self action:@selector(iconClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)regisClick {
    [self.navigationController pushViewController:[[registeVC alloc] init] animated:YES];
}

- (void)loginClcik {
    if ([userTokenTool isLogin]) {
        [userTokenTool removeUserKey];
        [self setUpViewsWithIsLogined];
    }else [self.navigationController pushViewController:[[LoginViewC alloc] init] animated:YES];
}

- (void)iconClick {
    [self setPhotoAlert];
}


#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.userInfoArr.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.userInfoArr[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WBEditCell *cell = [tableView dequeueReusableCellWithIdentifier:@"edit"];
    return cell;
}

#pragma mark - photoDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {

    UIImage *photo = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    NSData *ImageData;
    if (UIImagePNGRepresentation(photo) == nil)
    {
        ImageData = UIImageJPEGRepresentation(photo, 1.0);
    }else
        ImageData = UIImagePNGRepresentation(photo);
    
    [self.userIcon setImage:photo forState:UIControlStateNormal];
    
    [[NSUserDefaults standardUserDefaults] setObject:ImageData forKey:@"icon"];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - private
- (void)setPhotoAlert {
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

#pragma mark - lazy
- (UITableView *)table {
    if (_table == nil) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(self.userIcon.frame) + 20, self.view.zy_width, self.view.zy_higth - CGRectGetMaxY(self.userIcon.frame) - 20 - self.regisOrLogin.zy_higth - 20 - 44)];
        _table.delegate = self;
        _table.dataSource = self;
        [_table registerNib:[UINib nibWithNibName:NSStringFromClass([WBEditCell class]) bundle:nil] forCellReuseIdentifier:@"edit"];
        _table.tableFooterView = [[UIView alloc] init];
        _table.rowHeight = self.view.zy_higth * 0.08;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.scrollEnabled = NO;
    }
    return _table;
}

- (NSMutableArray *)userInfoArr {
    if (_userInfoArr == nil) {
        _userInfoArr = [NSMutableArray arrayWithObjects:@"昵称",@"我的宠物", nil];
    }
    return _userInfoArr;
}

@end
