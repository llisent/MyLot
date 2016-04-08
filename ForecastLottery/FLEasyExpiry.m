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
    
    NSInteger redResult = 10 - expriySet.count;
    NSInteger blueResult;
    NSComparisonResult blueCompare = [selfModel.blue_1 compare:resultModel.blue_1];
    if (blueCompare != NSOrderedSame) {
        blueResult = 0;
    }else{
        blueResult = 1;
    }
    switch (redResult) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
            
        default:
            break;
    }
}

@end
