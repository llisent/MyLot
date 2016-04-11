//
//  FLDetailView.h
//  ForecastLottery
//
//  Created by Mrr on 16/4/11.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLDetailView : UIView

@property (weak, nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
