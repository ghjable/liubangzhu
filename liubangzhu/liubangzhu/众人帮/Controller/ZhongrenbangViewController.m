//
//  ZhongrenbangViewController.m
//  liubangzhu
//
//  Created by able on 15/12/21.
//  Copyright © 2015年 able. All rights reserved.
//

#import "ZhongrenbangViewController.h"
#import "ZRBDetailFWZViewController.h"
#import "ZRBDetailGouWuViewController.h"
#import "ZRBDetailBMORNBMViewController.h"
#import "ZRBDetailJZOrNJZViewController.h"
#import "ZRBDetailTouPiaoViewController.h"

#import "SDCycleScrollView.h"
#import "ZRBHeaderCell.h"
#import "ZRBSecondSectionCell.h"

@interface ZhongrenbangViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) NSMutableArray *allArray;
@property (nonatomic,strong) NSMutableArray *gongyiArray;
@property (nonatomic,strong) NSMutableArray *peixunArray;
@property (nonatomic,strong) NSMutableArray *xiaoyuanArray;
@property (nonatomic,strong) NSMutableArray *xiangmuArray;;

@property (nonatomic,assign) NSInteger n;

@end

@implementation ZhongrenbangViewController

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [@[@[@1],@[@2,@2],@[@3,@3,@3],@[@4,@4,@4,@4],@[@4,@4,@4,@4,@4],@[@"1"],@[@"1",@"2"],@[@"1"]] mutableCopy];
    }
    return _dataSource;
}

/**
 *  加载视图
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"众人帮";
    
    //初始化标签下标为0
    self.n = 0;
    
    self.navigationController.navigationBar.translucent = YES;
    self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[ZRBHeaderCell class] forCellReuseIdentifier:@"oneCell"];
    [_tableView registerClass:[ZRBSecondSectionCell class] forCellReuseIdentifier:@"twoCell"];
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
        switch (self.n) {
            case  0:
                return [self.dataSource[4] count];
                break;
            case  1:
                return [self.dataSource[3] count];
                break;
            case  2:
                return [self.dataSource[2] count];
                break;
            case  3:
                return [self.dataSource[1] count];
                break;
            case  4:
                return [self.dataSource[0] count];
                break;
            case  5:
                return [self.dataSource[5] count];
                break;
            case  6:
                return [self.dataSource[6] count];
                break;
            case  7:
                return [self.dataSource[7] count];
                break;
                
                
            default:
                return 0;
                break;
        }
    }
}

/**
 *  返回分区的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        ZRBHeaderCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"oneCell" forIndexPath:indexPath];
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
        ZRBSecondSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twoCell" forIndexPath:indexPath];
        ZRBSYModel *model = self.dataSource[indexPath.row];
        cell.model = model;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (1 == indexPath.section) {
        NSInteger num = indexPath.row %  5;
        switch (num) {
            case 0:
                NSLog(@"%ld",num);
            {
                ZRBDetailFWZViewController *fWZVC = [[ZRBDetailFWZViewController alloc] init];
                [self.navigationController pushViewController:fWZVC animated:YES];
            }
                break;
            case 1:
                NSLog(@"%ld",num);
            {
                ZRBDetailBMORNBMViewController *bMVC = [[ZRBDetailBMORNBMViewController alloc] init];
                [self.navigationController pushViewController:bMVC animated:YES];
            }
                break;
            case 2:
                NSLog(@"%ld",num);
            {
                ZRBDetailTouPiaoViewController *touPiaoVC = [[ZRBDetailTouPiaoViewController alloc] init];
                [self.navigationController pushViewController:touPiaoVC animated:YES];
            }
                break;
            case 3:
                NSLog(@"%ld",num);
            {
                ZRBDetailJZOrNJZViewController *juanZhuVC = [[ZRBDetailJZOrNJZViewController alloc] init];
                [self.navigationController pushViewController:juanZhuVC animated:YES];
            }
                break;
            case 4:
                NSLog(@"%ld",num);
            {
                ZRBDetailGouWuViewController *gouWuVC = [[ZRBDetailGouWuViewController alloc] init];
                [self.navigationController pushViewController:gouWuVC animated:YES];
            }
                break;
                
            default:
                break;
        }
    }
    
}

/**
 *  第二分区添加页眉视图
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (1 == section) {
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        scroll.backgroundColor = [UIColor whiteColor];
        scroll.contentSize = CGSizeMake(84 * 8, 40);
        scroll.showsHorizontalScrollIndicator = NO;
        scroll.bounces = NO;
        NSArray *titleArray = @[@"全部",@"公益",@"培训",@"校园",@"项目",@"1",@"2",@"3"];
        for (int i = 0; i < 8; i++) {
            //scrollView上面添加button
            UIButton *but = [UIButton buttonWithType:UIButtonTypeSystem];
            but.frame = CGRectMake(0 + 84 * i, 0, 83, 40);
            but.tag = 100 + i;
            [but setTitle:titleArray[i] forState:UIControlStateNormal];
            [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [but addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
            [scroll addSubview:but];
            
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(83 * (i + 1) + i, 0, 1, 40)];
            line.backgroundColor = color_line2;
            [scroll addSubview:line];
        }
        
        //画线
        UIView *leftLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 40)];
        leftLine.backgroundColor = color_line2;
        [scroll addSubview:leftLine];
        
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 84 * 8, 1)];
        topLine.backgroundColor = color_line2;
        [scroll addSubview:topLine];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, scroll.frame.size.height - 1, 84 * 8, 1)];
        bottomLine.backgroundColor = color_line2;
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
    return 240;
}

/**
 *  标签按钮的点击响应事件
 */
- (void)butClick:(UIButton *)sender {
    switch (sender.tag) {
        case 100:
            self.n = 0;
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case 101:
            self.n = 1;
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case 102:
            self.n = 2;
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case 103:
            self.n = 3;
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case 104:
            self.n = 4;
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case 105:
            self.n = 5;
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case 106:
            self.n = 6;
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case 107:
            self.n = 7;
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
