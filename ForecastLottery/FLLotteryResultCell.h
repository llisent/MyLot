//
//  FLLotteryResultCell.h
//  ForecastLottery
//
//  Created by 赵新 on 16/4/9.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLSSQModel.h"
#import "FLDLTModel.h"

@interface FLLotteryResultCell : UITableViewCell
@property (weak, nonatomic  ) IBOutlet UILabel     *firstItem;
@property (weak, nonatomic  ) IBOutlet UILabel     *secondItem;
@property (weak, nonatomic  ) IBOutlet UILabel     *thirdItem;
@property (weak, nonatomic  ) IBOutlet UILabel     *fourthItem;
@property (weak, nonatomic  ) IBOutlet UILabel     *fifthItem;
@property (weak, nonatomic  ) IBOutlet UILabel     *sixthItem;
@property (weak, nonatomic  ) IBOutlet UILabel     *seventhItem;
@property (weak, nonatomic  ) IBOutlet UILabel     *lotteryName;
@property (weak, nonatomic  ) IBOutlet UILabel     *lotteryNum;
@property (weak, nonatomic  ) IBOutlet UILabel     *resultDate;

@property (assign, nonatomic) LotteryType currentType;

@property (strong, nonatomic) FLDLTModel  *dltModel;
@property (strong, nonatomic) FLSSQModel  *ssqModel;


- (void)updateInfomationWithDic:(NSDictionary *)dic;

@end
