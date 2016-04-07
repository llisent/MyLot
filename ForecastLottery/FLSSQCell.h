//
//  FLSSQCell.h
//  ForecastLottery
//
//  Created by Mrr on 16/4/6.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLSSQModel.h"

@interface FLSSQCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *mr1;
@property (weak, nonatomic) IBOutlet UILabel *mr2;
@property (weak, nonatomic) IBOutlet UILabel *mr3;
@property (weak, nonatomic) IBOutlet UILabel *mr4;
@property (weak, nonatomic) IBOutlet UILabel *mr5;
@property (weak, nonatomic) IBOutlet UILabel *mr6;
@property (weak, nonatomic) IBOutlet UILabel *mb1;

- (void)refreshDataWithModel:(FLSSQModel *)model;

@end
