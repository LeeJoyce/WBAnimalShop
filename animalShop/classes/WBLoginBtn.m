//
//  LoginBtn.m
//  animalShop
//
//  Created by JOY on 17/5/16.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "WBLoginBtn.h"

@implementation WBLoginBtn

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setBackgroundColor:WBMainColor];
    [self setTitleColor:ZYWhite forState:UIControlStateNormal];
}


@end
