//
//  FLArchive.h
//  ForecastLottery
//
//  Created by Mrr on 16/4/11.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FLArchive : NSObject

//存储模型
+ (BOOL)archiveDataWithArray:(NSArray *)dataArr
                 lotteryType:(LotteryType)type;

+ (NSDictionary *)readArchiveDataWithType:(LotteryType)type;

@end
