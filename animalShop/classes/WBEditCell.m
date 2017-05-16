//
//  WBEditCell.m
//  animalShop
//
//  Created by JOY on 17/5/16.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "WBEditCell.h"

@interface WBEditCell ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *infoTF;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (strong, nonatomic) NSString *tfText;


@end

@implementation WBEditCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.infoTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, self.infoTF.zy_higth)];
    self.infoTF.leftViewMode = UITextFieldViewModeAlways;
    self.infoTF.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)setCellWithIndex:(NSInteger)index InfoArr:(NSMutableArray *)arr {
    self.infoTF.text = arr[index];
}


@end
