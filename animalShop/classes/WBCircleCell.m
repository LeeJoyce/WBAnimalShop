//
//  WBCircleCell.m
//  animalShop
//
//  Created by JOY on 17/5/17.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "WBCircleCell.h"

@interface WBCircleCell ()

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
    if ([dict[@"icon"] isKindOfClass:[UIImage class]]) {
        self.icon.image = dict[@"icon"];
    }else self.icon.image = [UIImage imageNamed:dict[@"icon"]];
    
    self.name.text = dict[@"name"];
    
    if (dict[@"commnt"] == [NSNull null]) {
        self.commentLab.text = nil;
    }else self.commentLab.text = dict[@"commnt"];
    
    self.say.text = dict[@"text"];
    
    UIImage *img;
    if (dict[@"photo"] == [NSNull null]) {
        self.photo.image = nil;
    }else {
        if ([dict[@"photo"] isKindOfClass:[UIImage class]]) {
            img = dict[@"photo"];
        }else {
            img = [UIImage imageNamed:dict[@"photo"]];
        }
        UIImage *newImg = [self thumbnailWithImageWithoutScale:img size:CGSizeMake(self.zy_width * 0.55,img.size.height / img.size.width * self.zy_width * 0.6)];
        self.photo.image = newImg;
    }
}

- (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize
{
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    }
    else{
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width / asize.height > oldsize.width / oldsize.height) {
            rect.size.width = asize.height*oldsize.width / oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width) / 2;
            rect.origin.y = 0;
        } else{
            rect.size.width = asize.width;
            rect.size.height = asize.width * oldsize.height / oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height) / 2;
        }
        
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}


@end
