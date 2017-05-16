//
//  NewsCell.m
//  移动掌控
//
//  Created by Shuangwutech on 16/3/1.
//  Copyright © 2016年 Shuangwutech. All rights reserved.
//

#import "NewsCell.h"

@interface NewsCell ()

@end
@implementation NewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.attentionRed.hidden = NO;
   
}

#pragma mark - Public method
- (void)setUpLocalSourceWithIndex:(NSIndexPath *)indexPath
{
    self.titleLabel.text = @"安安宠物店上了一只英国短毛";
    self.dateLabel.text = @"2017-05-16 11:04:22";
    self.detailLabel.text = @"啤酒对狗狗有百害而无一利，一点都不能沾，除非你死心塌地地想要一只耷拉着啤酒肚、迈着小碎上学、没酒不动筷、整天都晕糊的酒香型狗狗。当您回到家它不会像其他庸俗的狗狗的一样来欢迎您，而是眼神迷离地望着您：“亲，今儿咱来青岛还是燕京";
    
//    switch (indexPath.row) {
//        case 0:
//            self.titleLabel.text = @"安安宠物店上了一只英国短毛";
//            self.dateLabel.text = @"2017-05-16 11:04:22";
//            self.detailLabel.text = @"啤酒对狗狗有百害而无一利，一点都不能沾，除非你死心塌地地想要一只耷拉着啤酒肚、迈着小碎上学、没酒不动筷、整天都晕糊的酒香型狗狗。当您回到家它不会像其他庸俗的狗狗的一样来欢迎您，而是眼神迷离地望着您：“亲，今儿咱来青岛还是燕京";
//            break;
//            
//        default:
//            break;
//    }
}



//- (void)layoutSubviews
//{
//    self.ZK_height -= 0.3;
//    [super layoutSubviews];
//}


@end
