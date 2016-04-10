//
//  FLLotteryResultViewController.m
//  ForecastLottery
//
//  Created by Mrr on 16/4/8.
//  Copyright © 2016年 llisent. All rights reserved.
//

#import "FLLotteryResultViewController.h"
#import "FLLotteryResultCell.h"
#import "FLDLTModel.h"
#import "FLSSQModel.h"

@interface FLLotteryResultViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic ,strong) UITableView *lotteryTableView;

@property (nonatomic ,strong) NSDictionary *ssqDic;
@property (nonatomic ,strong) NSDictionary *dltDic;


@end

@implementation FLLotteryResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开奖记录";
    
    [self getinfomation];
    [self creatContomUI];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.220 green:0.227 blue:0.263 alpha:1.000];
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightBarButtonItemOnClick)];
    self.navigationItem.rightBarButtonItem = rightBar;
}

- (void)getinfomation{
    [[SMNetWorkManager sharedInstence]getNetEaseLotteryResult:^(long status, NSString *err, NSArray *arr) {
        for (NSDictionary *dic in arr) {
            NSString *name = dic[@"gameEn"];
            if ([name isEqualToString:@"ssq"]) {
                self.ssqDic = dic;
            }else if ([name isEqualToString:@"dlt"]){
                self.dltDic = dic;
            }
        }
        [self.lotteryTableView reloadData];
    }];
}

- (void)creatContomUI{
    self.lotteryTableView                = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.lotteryTableView.delegate       = self;
    self.lotteryTableView.dataSource     = self;
    self.lotteryTableView.rowHeight      = 110;
    self.lotteryTableView.backgroundColor = [UIColor colorWithRed:0.220 green:0.227 blue:0.263 alpha:1.000];
    self.lotteryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.lotteryTableView registerNib:[UINib nibWithNibName:@"FLLotteryResultCell" bundle:nil]forCellReuseIdentifier:@"firstCell"];
    [self.view addSubview:self.lotteryTableView];
}

- (void)rightBarButtonItemOnClick{
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.ssqDic && self.dltDic) {
        return 2;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FLLotteryResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.ssqDic && self.dltDic) {
        if (indexPath.row == 0) {
            [cell updateInfomationWithDic:self.ssqDic];
        }else{
            [cell updateInfomationWithDic:self.dltDic];
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            
            break;
        case 1:
            
            break;
            
        default:
            break;
    }
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
