//
//  FLMainTools.h
//  ForecastLottery
//
//  Created by Mrr on 16/4/7.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FLMainTools : NSObject

@property (nonatomic, assign)LotteryType currentType;

+ (instancetype)instance;

@end
