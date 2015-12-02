//
//  ViewController.m
//  自适应高度
//
//  Created by lanou3g on 15/11/26.
//  Copyright © 2015年 陈伟. All rights reserved.
//

#import "ViewController.h"
#import "myTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HttpRequestData *requestData;
@property (nonatomic, strong) myTableViewCell *cell;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self requesteData];
}
- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        [_tableView registerClass:[myTableViewCell class] forCellReuseIdentifier:@"cell"];
        
    }
    return _tableView;
}

- (HttpRequestData *)requestData{
    if (!_requestData) {
        _requestData = [[HttpRequestData alloc] init];
    }
    return _requestData;
}
/**
 *  Description 网络请求
 */
- (void)requesteData{
    [self.requestData httpRequestWithDataUrlString:musicUrl dataBlock:^(NSArray *array) {
        self.dataArray = array;
        [self.tableView reloadData];
    }];
}
/**
 *  tableViewDelegate代理方法
 *
 *  @param tableView cell数量
 *  @param section   ...
 *
 *  @return 数组个数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   self.cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    MusicListModel *model = self.dataArray[indexPath.row];
    [self.cell configForCellOfImageSring:model.image labelHeiht:model.descriptions];
    return self.cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    MusicListModel *model = self.dataArray[indexPath.row];
    return  [self.cell setImageSize:model.image]+[self.cell configForCellOfHeight:model.descriptions];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
