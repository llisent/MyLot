//
//  FLGainDLT.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/6.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "FLGainDLT.h"
#import "FLDLTModel.h"

@implementation FLGainDLT

+ (void)getDLTLotteryNumWithCount:(NSInteger)count
                      returnBlock:(void (^)(NSArray *))success{
    
    NSMutableArray *result  = [NSMutableArray arrayWithCapacity:count];
    NSMutableArray *redSet  = [NSMutableArray arrayWithCapacity:35];
    NSMutableArray *blueSet = [NSMutableArray arrayWithCapacity:12];
    
    //创建模型池(RED)
    for (NSInteger i = 1; i <= 35; i++) {
        NSNumber *element = [NSNumber numberWithInteger:i];
        [redSet addObject:element];
    }
    
    //创建模型池(BLUE)
    for (NSInteger i = 1; i <= 12; i++) {
        NSNumber *element = [NSNumber numberWithInteger:i];
        [blueSet addObject:element];
    }
    
    //异步创建Model
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (NSInteger i = 0; i < count; i++) {
            FLDLTModel *model           = [[FLDLTModel alloc]init];
            NSMutableArray *tempRed     = [NSMutableArray arrayWithArray:redSet];
            NSMutableArray *tempBlue    = [NSMutableArray arrayWithArray:blueSet];
            
            //随机数产生结果
            NSMutableArray *randomRed  = [NSMutableArray arrayWithCapacity:5];
            NSMutableArray *randomBlue = [NSMutableArray arrayWithCapacity:2];
            
            //随机数个数
            for (int i = 0; i < 5; i++) {
                int t        = arc4random()%tempRed.count;
                randomRed[i] = tempRed[t];
                tempRed[t]   = [tempRed lastObject];//交换位置
                [tempRed removeLastObject];
            }
            
            for (int i = 0; i < 2; i++) {
                int t         = arc4random()%tempBlue.count;
                randomBlue[i] = tempBlue[t];
                tempBlue[t] = [tempBlue lastObject];//交换位置
                [tempBlue removeLastObject];
            }
            
            //冒泡排序
            for (int i = 0; i < 4; i++) {
                for (int j = 0; j < 5 - i - 1; j++) {
                    if (randomRed[j+1] < randomRed[j]) {
                        NSNumber *temp   = randomRed[j];
                        randomRed[j]   = randomRed[j+1];
                        randomRed[j+1] = temp;
                    }
                }
            }
            

            model.red_1 = randomRed[0];
            model.red_2 = randomRed[1];
            model.red_3 = randomRed[2];
            model.red_4 = randomRed[3];
            model.red_5 = randomRed[4];
            
            if (randomBlue[0] > randomBlue[1]) {
                model.blue_1 = randomBlue[1];
                model.blue_2 = randomBlue[0];
            }else{
                model.blue_1 = randomBlue[0];
                model.blue_2 = randomBlue[1];
            }
            [result addObject:model];
        }
        success(result);
    });

}

@end
