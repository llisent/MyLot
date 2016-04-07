//
//  FLMainViewController.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/6.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "FLMainViewController.h"
#import "FLSSQCell.h"
#import "FLSSQModel.h"

@interface FLMainViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic ,strong)NSMutableArray *lotteryArray;

@end

@implementation FLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lotteryArray = [[NSMutableArray alloc]init];
    [self creatCostomUI];
}

- (void)creatCostomUI{
    self.lotteryTableView.delegate   = self;
    self.lotteryTableView.dataSource = self;
    self.lotteryTableView.rowHeight  = 45;
    [self.lotteryTableView registerNib:[UINib nibWithNibName:@"FLSSQCell" bundle:nil] forCellReuseIdentifier:@"lotteryCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.lotteryArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FLSSQCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lotteryCell" forIndexPath:indexPath];
    FLSSQModel *model = self.lotteryArray[indexPath.row];
    [cell refreshDataWithModel:model];
    return cell;
}

- (IBAction)creatLottery:(id)sender {
    __weak typeof(self)weakSelf = self;
    [FLGainSSQ getSSQLotteryNumWithCount:5 returnBlock:^(NSArray *modelArr) {
        [weakSelf.lotteryArray addObjectsFromArray:modelArr];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [weakSelf.lotteryTableView reloadData];
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
