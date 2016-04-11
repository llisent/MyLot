//
//  FLEasyExpiry.h
//  ForecastLottery
//
//  Created by Mrr on 16/4/8.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLSSQModel.h"
#import "FLDLTModel.h"

@interface FLEasyExpiry : NSObject

+ (void)getExpriyInfoBy:(FLSSQModel *)selfModel withResult:(FLSSQModel *)resultModel;

@end
