//
//  WBCircleCell.m
//  animalShop
//
//  Created by JOY on 17/5/17.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "WBCircleCell.h"

@interface WBCircleCell ()
@property (weak, nonatomic) IBOutlet UIButton *sayBtn;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *say;
@property (weak, nonatomic) IBOutlet UILabel *commentLab;
@end

@implementation WBCircleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
