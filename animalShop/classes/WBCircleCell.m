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
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *commentLab;
@end

@implementation WBCircleCell

- (void)awakeFromNib {
    [super awakeFromNib];

}


- (void)setSourceWithSourceDict:(NSDictionary *)dict {
    self.icon.image = [UIImage imageNamed:dict[@"icon"]];
    self.name.text = dict[@"name"];
    if (dict[@"commnt"] == [NSNull null]) {
        self.commentLab.zy_higth = 1;
    }else self.commentLab.text = dict[@"commnt"];
    self.say.text = dict[@"text"];
    if (dict[@"photo"] == [NSNull null]) {
        self.photo.zy_higth = 1;
    }else self.photo.image = [UIImage imageNamed:dict[@"photo"]];
}

@end
