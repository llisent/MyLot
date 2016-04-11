//
//  FLArchive.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/11.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "FLArchive.h"

@implementation FLArchive

+ (BOOL)archiveDataWithArray:(NSArray *)dataArr
                 lotteryType:(LotteryType)type{
    BOOL flag;
    NSString *pathStr;
    switch (type) {
        case LotteryTypeSSQ:
            pathStr = @"ssq.archiver";
            break;
        case LotteryTypeDLT:
            pathStr = @"dlt.archiver";
            break;
        case LotteryTypeNum3:
            pathStr = @"num3.archiver";
            break;
            
        default:
            break;
    }
    //获取当前时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *date                 = [dateFormatter stringFromDate:[NSDate date]];
    
    //获取路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1, YES)lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:pathStr];
    
    NSDictionary *arcDic = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    if (arcDic) {
        NSMutableDictionary *arcMdic = [NSMutableDictionary dictionaryWithDictionary:arcDic];
        [arcMdic setObject:dataArr forKey:date];
        flag = [NSKeyedArchiver archiveRootObject:arcMdic toFile:path];
    }else{
        NSDictionary *dic = @{date:dataArr};
        flag = [NSKeyedArchiver archiveRootObject:dic toFile:path];
    }
    return flag;
}

+ (NSDictionary *)readArchiveDataWithType:(LotteryType)type{
    NSString *pathStr;
    switch (type) {
        case LotteryTypeSSQ:
            pathStr = @"ssq.archiver";
            break;
        case LotteryTypeDLT:
            pathStr = @"dlt.archiver";
            break;
        case LotteryTypeNum3:
            pathStr = @"num3.archiver";
            break;
            
        default:
            break;
    }
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1, YES)lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:pathStr];
    
    NSDictionary *arcDic = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return arcDic;
}

@end
