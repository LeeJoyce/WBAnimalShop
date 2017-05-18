//
//  AnimalKindsCell.m
//  animalShop
//
//  Created by wangzhongyi on 17/5/18.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "AnimalKindsCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface AnimalKindsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *animalImageView;
@property (weak, nonatomic) IBOutlet UILabel *animalNameLabel;

@end

@implementation AnimalKindsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(AnimalModel *)model
{
    _model = model;
    _animalNameLabel.text = model.name;
//    [_animalImageView sd_setImageWithURL:[NSURL URLWithString:model.imageName]];
    [_animalImageView sd_setImageWithURL:[NSURL URLWithString:@"http://img.boqiicdn.com/Data/BK/P/imagick83771435571788.png"] placeholderImage:[UIImage imageNamed:@"delete"]];
    NSLog(@"%@", model.imageName);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
