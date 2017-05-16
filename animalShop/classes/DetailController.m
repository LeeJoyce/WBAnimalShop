//
//  DetailController.m
//  移动掌控
//
//  Created by Shuangwutech on 16/3/2.
//  Copyright © 2016年 Shuangwutech. All rights reserved.
//

#import "DetailController.h"
#import "AppDelegate.h"
@interface DetailController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mainScroll;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@end

@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息";
    
    self.mainScroll.showsVerticalScrollIndicator = NO;
    self.mainScroll.bounces = NO;
    
    self.titleLabel.text = self.titleText;
    self.detailLabel.text = self.contentText;
}



- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
