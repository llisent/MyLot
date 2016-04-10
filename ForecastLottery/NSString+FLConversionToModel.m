//
//  NSString+FLConversionToModel.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/8.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "NSString+FLConversionToModel.h"

@implementation NSString (FLConversionToModel)

- (FLSSQModel *)conversionToSSQ{
    FLSSQModel *model = [[FLSSQModel alloc]init];
    for (NSInteger i = 0; i < 7; i++) {
        NSString *singleStr = [self substringWithRange:NSMakeRange(2*i, 2)];
        NSNumber *singleResult = [NSNumber numberWithString:singleStr];
        switch (i) {
            case 0:
                model.red_1 = singleResult;
                break;
            case 1:
                model.red_2 = singleResult;
                break;
            case 2:
                model.red_3 = singleResult;
                break;
            case 3:
                model.red_4 = singleResult;
                break;
            case 4:
                model.red_5 = singleResult;
                break;
            case 5:
                model.red_6 = singleResult;
                break;
            case 6:
                model.blue_1 = singleResult;
                break;

            default:
                break;
        }
    }
    return model;
}

- (FLDLTModel *)conversionToDLT{
    FLDLTModel *model = [[FLDLTModel alloc]init];
    for (NSInteger i = 0; i < 7; i++) {
        NSString *singleStr = [self substringWithRange:NSMakeRange(2*i, 2)];
        NSNumber *singleResult = [NSNumber numberWithString:singleStr];
        switch (i) {
            case 0:
                model.red_1 = singleResult;
                break;
            case 1:
                model.red_2 = singleResult;
                break;
            case 2:
                model.red_3 = singleResult;
                break;
            case 3:
                model.red_4 = singleResult;
                break;
            case 4:
                model.red_5 = singleResult;
                break;
            case 5:
                model.blue_1 = singleResult;
                break;
            case 6:
                model.blue_2 = singleResult;
                break;
                
            default:
                break;
        }
    }
    return model;
}

- (NSString *)removeChar{
    NSString *str = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    str           = [str stringByReplacingOccurrencesOfString:@":" withString:@""];
    str           = [str stringByReplacingOccurrencesOfString:@"+" withString:@""];
    return str;
}

@end
