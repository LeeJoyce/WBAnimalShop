//
//  WBEditCell.m
//  animalShop
//
//  Created by JOY on 17/5/16.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "WBEditCell.h"

@interface WBEditCell ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (strong, nonatomic) NSString *tfText;


@end

@implementation WBEditCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = NO;
    self.infoTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, self.infoTF.zy_higth)];
    self.infoTF.leftViewMode = UITextFieldViewModeAlways;
    self.infoTF.userInteractionEnabled = NO;
    
    self.infoTF.delegate = self;
    [self.editBtn addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
}

- (void)edit {
    self.infoTF.userInteractionEnabled = YES;
    [self.infoTF becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:@"nick"];
    }else {
        [[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:@"anmial"];
    }
    [textField resignFirstResponder];
    return YES;
}



@end
