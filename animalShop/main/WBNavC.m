//
//  ZYNavigationC.m
//  WiFiKeepers
//
//  Created by JOY on 16/3/8.
//  Copyright © 2016年 JOY. All rights reserved.
//

#import "WBNavC.h"

@interface WBNavC ()<UIGestureRecognizerDelegate>

@end

@implementation WBNavC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
    self.navigationBar.barTintColor = ZYWhite;
//    self.navigationBar.barStyle =  1;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
//        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [backBtn setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
//        [backBtn sizeToFit];
//        [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        viewController.hidesBottomBarWhenPushed = YES;
    }
        [super pushViewController:viewController animated:animated];
}

//- (void)back:(UIViewController *)viewController {
//    [self popViewControllerAnimated:YES];
//}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.childViewControllers.count > 1;
}


@end
