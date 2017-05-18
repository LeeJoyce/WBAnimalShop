//
//  WBCircleDetialVC.h
//  animalShop
//
//  Created by JOY on 17/5/18.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CircleDetialDelegate <NSObject>

@optional


@end

@interface WBCircleDetialVC : UIViewController
@property (weak, nonatomic) id delegate;

@property (strong, nonatomic) UIImage *photo;

@end
