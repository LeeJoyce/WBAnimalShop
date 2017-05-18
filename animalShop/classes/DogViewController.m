//
//  DogViewController.m
//  animalShop
//
//  Created by wangzhongyi on 17/5/17.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "DogViewController.h"

@interface DogViewController ()

@end

@implementation DogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"宠物狗";
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"json" ofType:@"txt"];
    NSError *error = nil;
    NSString *jsonStr = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@", array);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
