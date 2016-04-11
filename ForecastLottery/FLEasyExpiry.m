//
//  FLEasyExpiry.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/8.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "FLEasyExpiry.h"

@implementation FLEasyExpiry

+ (void)getExpriyInfoBy:(FLSSQModel *)selfModel withResult:(FLSSQModel *)resultModel{
    NSArray *selfArr = @[selfModel.red_1,
                         selfModel.red_2,
                         selfModel.red_3,
                         selfModel.red_4,
                         selfModel.red_5,
                         selfModel.red_6];
    
    NSArray *resultArr = @[resultModel.red_1,
                           resultModel.red_2,
                           resultModel.red_3,
                           resultModel.red_4,
                           resultModel.red_5,
                           resultModel.red_6];
    
    NSMutableSet *expriySet = [NSMutableSet setWithArray:selfArr];
    [expriySet addObjectsFromArray:resultArr];
    
    NSUInteger redResult = 12 - expriySet.count;
    NSUInteger blueResult;
    NSComparisonResult blueCompare = [selfModel.blue_1 compare:resultModel.blue_1];
    
    if (blueCompare != NSOrderedSame) {
        blueResult = 0;
    }else{
        blueResult = 1;
    }
    
    NSLog(@"%ld-%ld",redResult,blueResult);
    
    if (blueResult == 0) {
        if (redResult < 4) {
            NSLog(@"无");
        }else if (redResult == 4){
            NSLog(@"10");
        }else if (redResult == 5){
            NSLog(@"200");
        }else{
            NSLog(@"二等奖");
        }
    }else{
        if (blueResult < 3) {
            NSLog(@"5");
        }else if (blueResult == 3){
            NSLog(@"10");
        }else if (blueResult == 4){
            NSLog(@"200");
        }else if (blueResult == 5){
            NSLog(@"3000");
        }else{
            NSLog(@"一等奖");
        }
    }
}

@end
