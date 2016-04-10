//
//  SMNetWorkManager.h
//  Oneiromancy
//
//  Created by Mrr on 16/1/27.
//  Copyright © 2016年 lnzsbks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>


typedef void(^SuccessWithErrorBlock)(long status, NSString *err, NSArray *arr);



@interface SMNetWorkManager : NSObject

@property(nonatomic,retain)AFHTTPRequestOperationManager *networkingManager;


+ (instancetype)sharedInstence;

- (void)getLottoryWithType:(NSString *)type
                   Success:(SuccessWithErrorBlock)success;

//获取网易开奖信息
- (void)getNetEaseLotteryResult:(SuccessWithErrorBlock)success;

@end
