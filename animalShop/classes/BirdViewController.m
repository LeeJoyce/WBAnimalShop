//
//  BirdViewController.m
//  animalShop
//
//  Created by wangzhongyi on 17/5/18.
//  Copyright © 2017年 JOY. All rights reserved.
//

#import "BirdViewController.h"

@interface BirdViewController ()

@end

@implementation BirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)jsonArray
{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"bird" ofType:@"txt"];
    NSError *error = nil;
    NSString *jsonStr = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    return [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    
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
