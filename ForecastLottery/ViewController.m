//
//  ViewController.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/6.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "ViewController.h"
#import "FLGainSSQ.h"
#import "FLSSQModel.h"
#import "FLGainDLT.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.188 green:0.596 blue:0.918 alpha:1.000];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",[NSDate date]);
//    [FLGainSSQ getSSQLotteryNumWithCount:1 returnBlock:^(NSArray *returnArr) {
//        NSLog(@"%@",[NSDate date]);
//        NSLog(@"%ld",returnArr.count);
//    }];
    
    [FLGainDLT getDLTLotteryNumWithCount:20 returnBlock:^(NSArray *arr) {
        for (FLSSQModel *model in arr) {
            NSLog(@"%@",model);
        }
    }];
}

@end
