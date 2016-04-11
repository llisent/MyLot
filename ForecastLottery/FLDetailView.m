//
//  FLDetailView.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/11.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "FLDetailView.h"

@implementation FLDetailView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"FLDetailView" owner:self options:nil][0];
        self.frame = frame;
    }
    return self;
}

@end
