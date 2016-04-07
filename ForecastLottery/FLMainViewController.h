//
//  FLMainViewController.h
//  ForecastLottery
//
//  Created by Mrr on 16/4/6.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLMainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *midBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property (weak, nonatomic) IBOutlet UITableView *lotteryTableView;
@end
