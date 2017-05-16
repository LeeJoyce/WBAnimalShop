//
//  WBAnimalJump.m
//  animalShop
//
//  Created by JOY on 17/5/15.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "WBAnimalJump.h"

@interface WBAnimalJump ()



@end

@implementation WBAnimalJump

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(jumpClick:) forControlEvents:UIControlEventTouchUpInside];
        self.highlighted = NO;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)setBtnWihthImageArr:(NSArray *)img kindArr:(NSArray *)kind {
    [self setImage:[UIImage imageNamed:img[self.tag]] forState:UIControlStateNormal];
    [self setTitle:kind[self.tag] forState:UIControlStateNormal];
    [self setTitleColor:WBMainColor forState:UIControlStateNormal];
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, self.zy_higth - 20, self.zy_width, 20);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 0, self.zy_width, self.zy_higth - 20);
}

- (void)jumpClick:(WBAnimalJump *)btn {
    
}


@end
