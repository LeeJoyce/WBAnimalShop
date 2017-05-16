//
//  NewsCell.h
//  移动掌控
//
//  Created by Shuangwutech on 16/3/1.
//  Copyright © 2016年 Shuangwutech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *attentionRed;

- (void)setUpLocalSourceWithIndex:(NSIndexPath *)indexPath;
@end
