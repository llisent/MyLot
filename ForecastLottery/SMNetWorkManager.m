//
//  SMNetWorkManager.m
//  Oneiromancy
//
//  Created by Mrr on 16/1/27.
//  Copyright © 2016年 lnzsbks. All rights reserved.
//

#import "SMNetWorkManager.h"

NSString * const apikey = @"5b77127a000f4bbf83794ce728eb2dd4";


@implementation SMNetWorkManager

+ (instancetype)sharedInstence{
    
    static SMNetWorkManager *manager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[SMNetWorkManager alloc]init];
        manager.networkingManager = [AFHTTPRequestOperationManager manager];
        manager.networkingManager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.networkingManager.requestSerializer.timeoutInterval = 10;
    });
    return manager;
}

- (void)getLottoryWithType:(NSString *)type Success:(SuccessWithErrorBlock)success{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *date                 = [dateFormatter stringFromDate:[NSDate date]];
    NSString *appid                = @"17640";

    NSDictionary *par = [NSDictionary dictionaryWithObjects:@[appid,apikey,date,type,@"100"]
                                                    forKeys:@[@"showapi_appid",@"showapi_sign",@"showapi_timestamp",@"code",@"count"]];

    NSString *url                  = @"https://route.showapi.com/44-2";
    
    [_networkingManager POST:url parameters:par success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if ([responseObject[@"showapi_res_code"] isEqual:@0]) {
            //成功
            NSArray *lotteryResult = responseObject[@"showapi_res_body"][@"result"];
            success(1,responseObject[@"showapi_res_error"],lotteryResult);
            
        }else{

        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

- (void)getNetEaseLotteryResult:(SuccessWithErrorBlock)success{
    [_networkingManager GET:@"http://api.caipiao.163.com/award_home.html" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSArray *arr = responseObject[@"data"];
        success(1,nil,arr);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
    }];
}

























@end
