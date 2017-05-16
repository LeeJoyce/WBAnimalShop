//
//  WBTabBar.m
//  animalShop
//
//  Created by JOY on 17/5/15.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "WBTabBar.h"
#import "WBMineVC.h"
#import "WBNoticeVC.h"
#import "WBCircleVC.h"
#import "WBMainVC.h"
#import "WBNavC.h"

@implementation WBTabBar

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildNav];
    [self setUpFont];
    self.selectedIndex = 0;
    self.tabBar.barTintColor =[UIColor whiteColor];
}

- (void)addChildNav {
    [self setUpOneChildVC:[[WBNavC alloc] initWithRootViewController:[[WBMainVC alloc] init]] title:@"主页" imageName:@"main" selImageName:@"main_sel"];
    [self setUpOneChildVC:[[WBNavC alloc] initWithRootViewController:[[WBCircleVC alloc] init]] title:@"圈子" imageName:@"circle" selImageName:@"circle_sel"];
    [self setUpOneChildVC:[[WBNavC alloc] initWithRootViewController:[[WBNoticeVC alloc] init]] title:@"消息" imageName:@"notice" selImageName:@"notice_sel"];
    [self setUpOneChildVC:[[WBNavC alloc] initWithRootViewController:[[WBMineVC alloc] init]] title:@"我的" imageName:@"mine" selImageName:@"mine_sel"];
}

- (void)setUpOneChildVC:(UIViewController *)VC title:(NSString *)title imageName:(NSString *)imageName selImageName:(NSString *)selImageName {
    VC.tabBarItem.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:imageName];
    VC.tabBarItem.selectedImage = [UIImage imageNamed:selImageName];
    [self addChildViewController:VC];
}

- (void)setUpFont {
    NSMutableDictionary *normalA = [NSMutableDictionary dictionary];
    normalA [NSFontAttributeName] = [UIFont systemFontOfSize:10];
    normalA [NSForegroundColorAttributeName] = ZYGray(94);
    
    NSMutableDictionary *selA = [NSMutableDictionary dictionary];
    selA [NSFontAttributeName] = [UIFont systemFontOfSize:10];
    selA [NSForegroundColorAttributeName] = WBMainColor;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalA forState:UIControlStateNormal];
    [item setTitleTextAttributes:selA forState:UIControlStateSelected];
}

@end
