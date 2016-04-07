//
//  FLMainTools.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/7.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "FLMainTools.h"

@implementation FLMainTools

+ (instancetype)instance{
    static FLMainTools *tools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[FLMainTools alloc]init];
    });
    return tools;
}

@end
