//
//  WBCircleHeaderView.m
//  animalShop
//
//  Created by JOY on 17/5/17.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "WBCircleHeaderView.h"

@interface WBCircleHeaderView ()
@property (weak, nonatomic) IBOutlet UIButton *headerBtn;


@end

@implementation WBCircleHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.icon.layer.borderWidth = 1;
    self.icon.layer.borderColor = ZYGray(200).CGColor;
    self.icon.layer.cornerRadius = self.icon.zy_width * 0.5;
    self.icon.layer.masksToBounds = YES;
}


@end
