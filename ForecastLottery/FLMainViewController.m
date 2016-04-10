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
#import "FLSettingViewController.h"
#import "FLLotteryResultViewController.h"

@interface FLMainViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic ,strong)NSMutableArray *lotteryArray;

@end

@implementation FLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lotteryArray = [[NSMutableArray alloc]init];
    [self creatCostomUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [[SMNetWorkManager sharedInstence]getLottoryWithType:@"ssq" Success:^(long status, NSString *err, NSArray *arr) {
        for (NSDictionary *dic in arr) {
            NSString *code = dic[@"openCode"];
            FLSSQModel *model = [code conversionToSSQ];
            NSLog(@"%@",[model.red_1 numberToString]);
        }
    }];
}

- (void)creatCostomUI{
    self.view.backgroundColor             = [UIColor colorWithRed:0.188 green:0.596 blue:0.918 alpha:1.000];
    self.lotteryTableView.backgroundColor = [UIColor clearColor];
    self.lotteryTableView.delegate        = self;
    self.lotteryTableView.dataSource      = self;
    self.lotteryTableView.rowHeight       = 45;
    self.lotteryTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    [self.lotteryTableView registerNib:[UINib nibWithNibName:@"FLSSQCell" bundle:nil] forCellReuseIdentifier:@"lotteryCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.lotteryArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FLSSQCell *cell      = [tableView dequeueReusableCellWithIdentifier:@"lotteryCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    FLSSQModel *model    = self.lotteryArray[indexPath.row];
    [cell refreshDataWithModel:model rowNum:indexPath.row];
    return cell;
}
- (IBAction)LotteryHistory:(id)sender {
    FLLotteryResultViewController *vc = [[FLLotteryResultViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    navi.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:navi animated:YES completion:nil];
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
- (IBAction)pushToSetting:(id)sender {
    FLSettingViewController *vc = [[FLSettingViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    navi.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:navi animated:YES completion:nil];
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
