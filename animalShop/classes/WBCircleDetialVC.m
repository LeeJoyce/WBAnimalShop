//
//  WBCircleDetialVC.m
//  animalShop
//
//  Created by JOY on 17/5/18.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "WBCircleDetialVC.h"

@interface WBCircleDetialVC ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textSView;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *ImgBtn;


@end

@implementation WBCircleDetialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setBase];
}


- (void)setNav {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(sentClick)];
}

- (void)setBase {
    [self.ImgBtn setBackgroundImage:self.photo forState:UIControlStateNormal];
    self.ImgBtn.userInteractionEnabled = NO;
    self.textSView.delegate = self;
    self.textSView.text = @"这一刻的想法...";
    self.textSView.textColor = ZYGray(200);
}


- (void)cancelClick {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"确定退出编辑？" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:sure];
    [alertVC addAction:cancel];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)sentClick {
    [self.textSView resignFirstResponder];
    if (self.photo == nil && ([self.textSView.textColor isEqual:ZYGray(200)] || self.textSView.text.length == 0)) {
        [SVProgressHUD showInfoWithStatus:@"您还什么都没写"];
        return;
    }
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        if ([_delegate respondsToSelector:@selector(releaseCircleWithText:Photo:)]) {
            NSString *say;
            if ([self.textSView.textColor isEqual:ZYGray(200)]) {
                say = nil;
            }else say = self.textSView.text;
            [_delegate releaseCircleWithText:say Photo:self.photo];
        }
    }];
}

- (IBAction)addPhone:(UIButton *)sender {
    [self setPhotoAlert];
}

- (IBAction)deleted:(UIButton *)sender {
    [self.ImgBtn setBackgroundImage:[UIImage imageNamed:@"addPhone"] forState:UIControlStateNormal];
    sender.hidden = YES;
    self.photo = nil;
    self.ImgBtn.userInteractionEnabled = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textSView resignFirstResponder];
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if ([textView.textColor isEqual:ZYGray(200)]) {
        textView.textColor = ZYGray(0);
        textView.text = nil;
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length == 0) {
        textView.text = @"这一刻的想法...";
        textView.textColor = ZYGray(200);
    }else if ([textView.textColor isEqual:ZYGray(200)]) {
        self.textSView.text = [textView.text substringFromIndex:self.textSView.text.length -1];
        textView.textColor = ZYGray(0);
    }
}




#pragma mark - photoDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *photo = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    [self.ImgBtn setBackgroundImage:photo forState:UIControlStateNormal];
    
    self.ImgBtn.userInteractionEnabled = NO;
    self.deleteBtn.hidden = NO;
    self.photo = photo;
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)setPhotoAlert {
    ZYSelf
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAct = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *playPhote = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf setPickerControllerWithSourceType:UIImagePickerControllerSourceTypeCamera];
    }];
    
    UIAlertAction *choses = [UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf setPickerControllerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    
    [alertVC addAction:cancelAct];
    [alertVC addAction:playPhote];
    [alertVC addAction:choses];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)setPickerControllerWithSourceType:(UIImagePickerControllerSourceType)type {
    UIImagePickerController *pickerPlay = [[UIImagePickerController alloc] init];
    pickerPlay.sourceType = type;
    pickerPlay.allowsEditing = YES;
    pickerPlay.delegate = self;
    [self.navigationController presentViewController:pickerPlay animated:YES completion:nil];
}






@end
