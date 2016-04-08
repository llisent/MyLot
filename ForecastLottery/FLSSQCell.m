//
//  FLSSQCell.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/6.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "FLSSQCell.h"

@implementation FLSSQCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSArray *arr = @[self.mr1,self.mr2,self.mr3,self.mr4,self.mr5,self.mr6,self.mb1];
    for (UIView *view in arr) {
        [self creatConstomUIWith:view];
    }
    
    {
        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(copyLotteryNum)];
        longPressGesture.minimumPressDuration = 1;
        [self addGestureRecognizer:longPressGesture];
        
        UISwipeGestureRecognizer *swipLeft = [[UISwipeGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            NSLog(@"左滑");
        }];
        swipLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        
        UISwipeGestureRecognizer *swipRight = [[UISwipeGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            NSLog(@"右滑");
        }];
        swipRight.direction = UISwipeGestureRecognizerDirectionRight;
        
        [self addGestureRecognizer:swipLeft];
        [self addGestureRecognizer:swipRight];
    }
}

- (void)copyLotteryNum{
    NSLog(@"长按复制");
}

- (void)refreshDataWithModel:(FLSSQModel *)model rowNum:(NSInteger)rank{
    TICK
    self.mr1.text = [model.red_1 numberToString];
    self.mr2.text = [model.red_2 numberToString];
    self.mr3.text = [model.red_3 numberToString];
    self.mr4.text = [model.red_4 numberToString];
    self.mr5.text = [model.red_5 numberToString];
    self.mr6.text = [model.red_6 numberToString];
    self.mb1.text = [model.blue_1 numberToString];
    TOCK
}

- (void)creatConstomUIWith:(UIView *)view{
    view.layer.cornerRadius = view.width / 2;
    if (![view isEqual:self.mb1]) {
        view.layer.borderColor = [UIColor orangeColor].CGColor;
        view.layer.borderWidth = 1;
    }else{
        view.layer.borderColor = [UIColor blueColor].CGColor;
        view.layer.borderWidth = 1;
    }
    view.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
