//
//  FLGainSSQ.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/6.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "FLGainSSQ.h"
#import "FLSSQModel.h"

@implementation FLGainSSQ

+ (void)getSSQLotteryNumWithCount:(NSInteger)count
                      returnBlock:(void (^)(NSArray *))success{
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    NSMutableArray *redSet = [NSMutableArray arrayWithCapacity:33];
    //创建模型池
    for (NSInteger i = 1; i <= 33; i++) {
        NSNumber *element = [NSNumber numberWithInteger:i];
        [redSet addObject:element];
    }
    //异步创建Model
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (NSInteger i = 0; i < count; i++) {
            FLSSQModel *model           = [[FLSSQModel alloc]init];
            NSMutableArray *tempArr     = [NSMutableArray arrayWithArray:redSet];

            //随机数产生结果
            NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:6];
            
            //随机数个数
            for (int i = 0; i < 6; i++) {
                int t          = arc4random()%tempArr.count;
                resultArray[i] = tempArr[t];
                tempArr[t]     = [tempArr lastObject];//交换位置
                [tempArr removeLastObject];
            }
            
            //冒泡排序
            for (int i = 0; i < 5; i++) {
                for (int j = 0; j < 6 - i - 1; j++) {
                    if (resultArray[j+1] < resultArray[j]) {
                        NSNumber *temp   = resultArray[j];
                        resultArray[j]   = resultArray[j+1];
                        resultArray[j+1] = temp;
                    }
                }
            }
            model.red_1 = resultArray[0];
            model.red_2 = resultArray[1];
            model.red_3 = resultArray[2];
            model.red_4 = resultArray[3];
            model.red_5 = resultArray[4];
            model.red_6 = resultArray[5];

            model.blue_1 = [NSNumber numberWithInt:arc4random()%17];
            [result addObject:model];
        }
        success(result);
    });
}

@end
