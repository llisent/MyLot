//
//  FLArchiveListCell.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/11.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "FLArchiveListCell.h"

@implementation FLArchiveListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)updateInformationWith:(NSString *)date{
    self.dateLabel.text = date;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
