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

    NSDictionary *par = [NSDictionary dictionaryWithObjects:@[appid,apikey,date,type,@"200"]
                                                    forKeys:@[@"showapi_appid",@"showapi_sign",@"showapi_timestamp",@"code",@"count"]];

    NSString *url                  = @"https://route.showapi.com/44-2";
    
    [_networkingManager POST:url parameters:par success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        success(1,nil,responseObject);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}



























@end
