//
//  FLGainSSQ.h
//  ForecastLottery
//
//  Created by Mrr on 16/4/6.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FLGainSSQ : NSObject

+ (void)getSSQLotteryNumWithCount:(NSInteger)count
                      returnBlock:(void (^)(NSArray *))success;

@end
