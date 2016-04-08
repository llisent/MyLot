//
//  NSString+FLConversionToModel.h
//  ForecastLottery
//
//  Created by Mrr on 16/4/8.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLDLTModel.h"
#import "FLSSQModel.h"

@interface NSString (FLConversionToModel)

//结果字符串转换为相应的Model
- (FLSSQModel *)conversionToSSQ;
- (FLDLTModel *)conversionToDLT;


@end
