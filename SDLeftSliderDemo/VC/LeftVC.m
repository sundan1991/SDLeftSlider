//
//  LeftVC.m
//  SDLeftSliderDemo
//
//  Created by sundan on 17/3/10.
//  Copyright © 2017年 lzt. All rights reserved.
//

#import "LeftVC.h"

@interface LeftVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong)   NSArray *dataArr;

@property (nonatomic ,strong)   UITableView *tableView;

@end

@implementation LeftVC

- (NSArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr =  @[@"产品系列",@"套间定制",@"收藏夹",@"购物车",@"订单查询",@"关于我们",@"数据管理"];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //加载tableView
    [self loadTableView];
}

#pragma mark - tableView
- (void)loadTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kLeftViewW, SCREEN_HEIGHT) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = [self loadTableHeaderView];
    self.tableView.backgroundColor = RGBACOLOR(213, 217, 218,1);
    self.tableView.layer.masksToBounds = false;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    self.view.clipsToBounds = false;
    self.view.layer.masksToBounds = false;
    
}
- (UIView *)loadTableHeaderView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kLeftViewW, 100)];
    view.backgroundColor = [UIColor yellowColor];
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellName = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellName];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //改变侧边栏选中状态
    if (self.block) {
        self.block(indexPath.row);
    }
    
}


@end
