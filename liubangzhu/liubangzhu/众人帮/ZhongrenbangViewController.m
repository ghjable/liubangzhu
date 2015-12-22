//
//  ZhongrenbangViewController.m
//  liubangzhu
//
//  Created by able on 15/12/21.
//  Copyright © 2015年 able. All rights reserved.
//

#import "ZhongrenbangViewController.h"
#import "SDCycleScrollView.h"
#import "HeaderCell.h"

@interface ZhongrenbangViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ZhongrenbangViewController
/**
 *  加载视图
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = YES;
    self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[HeaderCell class] forCellReuseIdentifier:@"oneCell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"twoCell"];
    [self.view addSubview:_tableView];
    
}

#pragma SDCycleScrollViewDelegate
/**
 *  点击轮播图的跳转方法
 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%ld",index);
}

#pragma UITableViewDataSource
/**
 *  返回分区数目
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

/**
 *  返回分区的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 10;
    }
}

/**
 *  返回分区的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        HeaderCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"oneCell" forIndexPath:indexPath];
        SDCycleScrollView *cycle = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120) imagesGroup:nil];
        cycle.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        cycle.delegate = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            cycle.titlesGroup = @[@"鹏速科技",@"事业有成",@"蒸蒸日上"];
            cycle.localizationImagesGroup = @[[UIImage imageNamed:@"img375-120"],[UIImage imageNamed:@"img375-120"],[UIImage imageNamed:@"img375-120"]];
        });
        [cell1.headerView addSubview:cycle];
        return cell1;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twoCell" forIndexPath:indexPath];
        cell.textLabel.text = @"123";
        cell.imageView.image = [UIImage imageNamed:@"head100-100"];
        return cell;
    }
}

/**
 *  第二分区添加页眉视图
 
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (1 == section) {
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        scroll.backgroundColor = [UIColor whiteColor];
        scroll.contentSize = CGSizeMake(84 * 5, 40);
        scroll.showsHorizontalScrollIndicator = NO;
        scroll.bounces = NO;
        NSArray *titleArray = @[@"全部",@"公益",@"培训",@"校园",@"项目"];
        for (int i = 0; i < 5; i++) {
            //scrollView上面添加button
            UIButton *but = [UIButton buttonWithType:UIButtonTypeSystem];
            but.frame = CGRectMake(0 + 84 * i, 0, 83, 40);
            [but setTitle:titleArray[i] forState:UIControlStateNormal];
            [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [scroll addSubview:but];
            
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(83 * (i + 1) + i, 0, 1, 40)];
            line.backgroundColor = [UIColor blackColor];
            [scroll addSubview:line];
        }
        
        //画线
        UIView *leftLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 40)];
        leftLine.backgroundColor = [UIColor blackColor];
        [scroll addSubview:leftLine];
        
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 84 * 5, 1)];
        topLine.backgroundColor = [UIColor blackColor];
        [scroll addSubview:topLine];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, scroll.frame.size.height - 1, 84 * 5, 1)];
        bottomLine.backgroundColor = [UIColor blackColor];
        [scroll addSubview:bottomLine];
        return scroll;
    }
    return nil;
}

/**
 *  页眉高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (1 == section) {
        return 40;
    }
    return 0;
}

/**
 *  行高
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 120;
    }
    return 80;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
