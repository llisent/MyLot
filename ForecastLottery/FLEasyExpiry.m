//
//  FLEasyExpiry.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/8.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "FLEasyExpiry.h"

@implementation FLEasyExpiry

- (void)getExpriyInfoBy:(FLSSQModel *)selfModel withResult:(FLSSQModel *)resultModel{
    NSArray *selfArr = @[selfModel.red_1,
                         selfModel.red_2,
                         selfModel.red_3,
                         selfModel.red_4,
                         selfModel.red_5,
                         selfModel.red_6];
    
    NSArray *resultArr = @[selfModel.red_1,
                           selfModel.red_2,
                           selfModel.red_3,
                           selfModel.red_4,
                           selfModel.red_5,
                           selfModel.red_6];
    
    NSMutableSet *expriySet = [NSMutableSet setWithArray:selfArr];
    [expriySet addObjectsFromArray:resultArr];
    
    NSUInteger redResult = 10 - expriySet.count;
    NSUInteger blueResult;
    NSComparisonResult blueCompare = [selfModel.blue_1 compare:resultModel.blue_1];
    
    if (blueCompare != NSOrderedSame) {
        blueResult = 0;
    }else{
        blueResult = 1;
    }
    
    if (blueResult == 0) {
        if (redResult < 4) {
            NSLog(@"无");
        }else if (redResult == 4){
            NSLog(@"10");
        }else if (redResult == 5){
            NSLog(@"200");
        }else{
            NSLog(@"ER");
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
            NSLog(@"YI");
        }
    }
}

@end
