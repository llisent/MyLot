//
//  NSNumber+FLPrint.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/7.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "NSNumber+FLPrint.h"

@implementation NSNumber (FLPrint)

- (NSString *)numberToString{
    NSMutableString *result = [NSMutableString stringWithFormat:@"%@",self];
    if (result.length == 1) {
        [result insertString:@"0" atIndex:0];
    }
    return result;
}

@end
