//
//  WBCircleCell.h
//  animalShop
//
//  Created by JOY on 17/5/17.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBCircleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *sayBtn;
- (void)setSourceWithSourceDict:(NSDictionary *)dict;
@end
