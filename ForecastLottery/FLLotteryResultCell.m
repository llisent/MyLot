//
//  FLLotteryResultCell.m
//  ForecastLottery
//
//  Created by 赵新 on 16/4/9.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "FLLotteryResultCell.h"

@implementation FLLotteryResultCell

- (void)awakeFromNib {
    NSArray *viewsArr = @[self.firstItem,self.secondItem,self.thirdItem,self.fourthItem,self.fifthItem,self.sixthItem,self.seventhItem];
    [self costomUIWithView:viewsArr];
    self.backgroundColor = [UIColor colorWithRed:0.220 green:0.227 blue:0.263 alpha:1.000];
}

- (void)costomUIWithView:(NSArray *)viewArr{
    for (UIView *view in viewArr) {
        view.layer.cornerRadius = view.width/2;
        view.clipsToBounds = YES;
    }
}

- (void)updateInfomationWithDic:(NSDictionary *)dic{
    NSString *type = dic[@"gameEn"];
    if ([type isEqualToString:@"ssq"]) {
        self.lotteryName.text          = @"双色球";
        FLSSQModel *model              = [[dic[@"awardNo"] removeChar] conversionToSSQ];
        self.sixthItem.backgroundColor = RGBA(205, 0, 42, 1);
        self.firstItem.text            = [model.red_1 numberToString];
        self.secondItem.text           = [model.red_2 numberToString];
        self.thirdItem.text            = [model.red_3 numberToString];
        self.fourthItem.text           = [model.red_4 numberToString];
        self.fifthItem.text            = [model.red_5 numberToString];
        self.sixthItem.text            = [model.red_6 numberToString];
        self.seventhItem.text          = [model.blue_1 numberToString];
    }else if ([type isEqualToString:@"dlt"]){
        self.lotteryName.text          = @"大乐透";
        FLDLTModel *model              = [[dic[@"awardNo"] removeChar] conversionToDLT];
        self.sixthItem.backgroundColor = [UIColor blueColor];
        self.firstItem.text            = [model.red_1 numberToString];
        self.secondItem.text           = [model.red_2 numberToString];
        self.thirdItem.text            = [model.red_3 numberToString];
        self.fourthItem.text           = [model.red_4 numberToString];
        self.fifthItem.text            = [model.red_5 numberToString];
        self.sixthItem.text            = [model.blue_1 numberToString];
        self.seventhItem.text          = [model.blue_2 numberToString];
    }
    self.resultDate.text = dic[@"awardTime"];
    self.lotteryNum.text = [NSString stringWithFormat:@"第%@期",dic[@"periodName"]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
