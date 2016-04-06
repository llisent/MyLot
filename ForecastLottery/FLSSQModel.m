//
//  FLSSQModel.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/6.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "FLSSQModel.h"

@implementation FLSSQModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.red_1  = [aDecoder decodeObjectForKey:@"red1"];
        self.red_2  = [aDecoder decodeObjectForKey:@"red2"];
        self.red_3  = [aDecoder decodeObjectForKey:@"red3"];
        self.red_4  = [aDecoder decodeObjectForKey:@"red4"];
        self.red_5  = [aDecoder decodeObjectForKey:@"red5"];
        self.red_6  = [aDecoder decodeObjectForKey:@"red6"];
        self.blue_1 = [aDecoder decodeObjectForKey:@"blue"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.red_1 forKey:@"red1"];
    [aCoder encodeObject:self.red_2 forKey:@"red2"];
    [aCoder encodeObject:self.red_3 forKey:@"red3"];
    [aCoder encodeObject:self.red_4 forKey:@"red4"];
    [aCoder encodeObject:self.red_5 forKey:@"red5"];
    [aCoder encodeObject:self.red_6 forKey:@"red6"];
    [aCoder encodeObject:self.blue_1 forKey:@"blue"];
}

@end
