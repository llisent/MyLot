//
//  FLArchiveListCell.h
//  ForecastLottery
//
//  Created by Mrr on 16/4/11.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLArchiveListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

- (void)updateInformationWith:(NSString *)date;

@end
