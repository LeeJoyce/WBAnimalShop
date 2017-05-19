//
//  ViewController.m
//  animalShop
//
//  Created by JOY on 17/5/15.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "WBMainVC.h"
#import "PussBannerView.h"
#import "WBAnimalJump.h"
#import "DogViewController.h"
#import "CatViewController.h"
#import "RatViewController.h"
#import "BirdViewController.h"
#import "FishViewController.h"
#import "RabbitViewController.h"

@interface WBMainVC ()<UISearchBarDelegate>

@property (weak, nonatomic) PussBannerView *banner;
@property (strong, nonatomic) UISearchBar *search;
@property (strong, nonatomic) UIScrollView *scroll;

@property (strong, nonatomic) NSArray *kindArr;
@property (strong, nonatomic) NSArray *imgArr;

@end

@implementation WBMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = ZYWhite;
    [self.view addSubview:self.search];
    [self.view addSubview:self.banner];
    [self.view addSubview:self.scroll];
    [self setAnimalJumpBtn];
}


- (void)setAnimalJumpBtn {
    int viewCount = (int)self.kindArr.count;
    int columnsCount = 2;
    CGFloat Margin = 20;
    CGFloat BtnW = (self.view.zy_width - Margin *(columnsCount + 1)) / columnsCount;
    CGFloat BtnH = 0.7 * BtnW;
    for (int i = 0; i < viewCount; i ++) {
        WBAnimalJump *animalBtn = [[WBAnimalJump alloc] initWithFrame:CGRectMake(i % columnsCount * (BtnW + Margin) + Margin, i / columnsCount * (BtnH + Margin) + Margin , BtnW, BtnH)];
        animalBtn.tag = i;
        [animalBtn setBtnWihthImageArr:self.imgArr kindArr:self.kindArr];
        [self.scroll addSubview:animalBtn];
        [animalBtn addTarget:self action:@selector(animalBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    self.scroll.contentSize = CGSizeMake(self.view.zy_width, Margin *(viewCount / columnsCount + 1) + (viewCount / columnsCount) * BtnH + (viewCount % columnsCount) * (Margin + BtnH));
}

#pragma mark - selector
- (void)animalBtnClick:(WBAnimalJump *)btn
{
    switch (btn.tag) {
        case 0:{
            DogViewController *dog = [[DogViewController alloc] init];
            [self.navigationController pushViewController:dog animated:YES];
        }
            break;
            
        case 1:{
            CatViewController *dog = [[CatViewController alloc] init];
            dog.title = btn.titleLabel.text;
            [self.navigationController pushViewController:dog animated:YES];
        }
            break;
            
        case 2:{
            RatViewController *dog = [[RatViewController alloc] init];
            dog.title = btn.titleLabel.text;
            [self.navigationController pushViewController:dog animated:YES];
        }
            break;
            
        case 3:{
            BirdViewController *dog = [[BirdViewController alloc] init];
            dog.title = btn.titleLabel.text;
            [self.navigationController pushViewController:dog animated:YES];
        }
            break;
            
        case 4:{
            FishViewController *dog = [[FishViewController alloc] init];
            dog.title = btn.titleLabel.text;
            [self.navigationController pushViewController:dog animated:YES];
        }
            break;
            
        case 5:{
            RabbitViewController *dog = [[RabbitViewController alloc] init];
            dog.title = btn.titleLabel.text;
            [self.navigationController pushViewController:dog animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_search resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
//    [self resignFirstResponder];   //这里写错了
    [self.view endEditing:YES];
}

- (UISearchBar *)search {
    if (_search == nil) {
        _search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, self.view.zy_width, 36)];
        _search.delegate = self;
        _search.showsCancelButton = true;
        [_search setPlaceholder:@"请输入想搜索的宠物类别"];
        _search.delegate = self;
    }
    return _search;
}
- (PussBannerView *)banner {
    if (_banner == nil) {
        _banner = [PussBannerView bannerWithFrame:CGRectMake(0, 64 + 36, self.view.zy_width, self.view.zy_width * 0.5) imageNameGroup:@[@"1",@"2",@"3"]shouldUnlimitedLoop:YES];
        _banner.isUnlimitedLoop = YES;
        _banner.pageAlignment = PussPageControlAlignmentCenter;
        _banner.currentDotColor = WBMainColor;
        _banner.dotColor = [UIColor lightTextColor];
        _banner.showPageControl = YES;
        _banner.scrollTimeInterval = 3;
    }
    return _banner;
}

- (UIScrollView *)scroll {
    if (_scroll == nil) {
        _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.banner.frame), self.view.zy_width, self.view.zy_higth - CGRectGetMaxY(self.banner.frame) - 44)];
        _scroll.backgroundColor = ZYColor(222, 222, 222);
    }
    return _scroll;
}

- (NSArray *)kindArr {
    if (_kindArr == nil) {
        _kindArr = [NSArray arrayWithObjects:@"宠物狗",@"宠物猫",@"宠物鼠",@"宠物鸟",@"水族宠物",@"其它", nil];
    }
    return _kindArr;
}

- (NSArray *)imgArr {
    if (_imgArr == nil) {
        _imgArr = [NSArray arrayWithObjects:@"dog",@"cat",@"mouse",@"bird",@"fish",@"rab", nil];
    }
    return _imgArr;
}

@end
