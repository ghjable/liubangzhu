//
//  XuanshangViewController.m
//  liubangzhu
//
//  Created by able on 15/12/21.
//  Copyright © 2015年 able. All rights reserved.
//

#import "XuanshangViewController.h"
#import "XuanShangTableViewCell.h"
#import "PublishViewController.h"
#import "XuanshangDetilViewController.h"
#import "SDCycleScrollView.h"
@interface XuanshangViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
{
    UIScrollView *_scrollView1;

}
@property(nonatomic,copy) NSString *Str1;
@property(nonatomic,copy) NSString *Str2;
@property(nonatomic,copy) NSString *Str3;
@property(nonatomic,strong) UITableView *myTableView;
@property(nonatomic,strong) UILabel *underline;


@end

@implementation XuanshangViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.barTintColor=maincolor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setNav];
    [self setTableView];
}
-(void)setTableView
{
    SDCycleScrollView *scr=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenWith, 120) imagesGroup:nil];
    scr.pageControlAliment=SDCycleScrollViewPageContolAlimentRight;
    scr.delegate=self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        scr.titlesGroup=nil;
        scr.localizationImagesGroup=@[[UIImage imageNamed:@"img355-160"],[UIImage imageNamed:@"img355-160"],[UIImage imageNamed:@"img375-120"]];
    });
    _myTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, KScreenWith, KScreenHeigh-64-49) style:UITableViewStylePlain];
    _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _myTableView.delegate=self;
    _myTableView.dataSource=self;
    _myTableView.tableHeaderView=scr;
    [self.view addSubview:_myTableView];
}
-(void)setNav
{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.text = @"悬赏";
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = color_line1;
    self.navigationItem.titleView = titleLabel;
    
    UIButton *leftBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UILabel *lable=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    lable.textColor=color_line1;
    lable.text=@"浙江科技学院";
    lable.font=[UIFont systemFontOfSize:11];
    [leftBtn addSubview:lable];
    UIImageView *leftimg=[[UIImageView alloc] initWithFrame:CGRectMake(70, 22, 10, 10)];
    leftimg.image=[UIImage imageNamed:@"icon10-10"];
    [leftBtn addSubview:leftimg];
    UIBarButtonItem *customButton = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = customButton;
    
    UIButton *rightbtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightbtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [rightbtn setImage:[UIImage imageNamed:@"icon44-44"] forState:UIControlStateNormal];
    UIBarButtonItem *systemButton = [[UIBarButtonItem alloc]initWithCustomView:rightbtn];
    self.navigationItem.rightBarButtonItem = systemButton;
    
}
-(void)leftBtnClick
{
    NSLog(@"left");
}
-(void)rightBtnClick
{
    PublishViewController *vc=[[PublishViewController alloc] init];
    vc.view.backgroundColor=bgcolor;
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)BtnClick:(UIButton *)btn
{
    [UIView animateWithDuration:0.5 animations:^{
        _underline.frame=CGRectMake(82*btn.tag, 35, 82, 5);
    }];
    
}
#pragma mark - pageControl的方法
- (void)pageControl:(UIPageControl *)pageControl{
    UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:2000];
    NSInteger i = pageControl.currentPage;
    [UIView animateWithDuration:0.5 animations:^{
        scrollView.contentOffset = CGPointMake((i+1) *  [UIScreen mainScreen].bounds.size.width, 0);
    }];
}
//定时器触发
-(void)timerFired{
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:1000];
    static int i=0;
    i++;
    _scrollView1.contentOffset=CGPointMake([UIScreen mainScreen].bounds.size.width*(i%3), 0);
    
    if (i==4||i==0) {
        
        if (i==0) {
            i=3;
        }else{
            i=1;
        }
        
    }
    pageControl.currentPage = i - 1;
}
#pragma mark TableView的代理和数据源
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIScrollView *scr=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 184, KScreenWith, 40)];
    scr.contentSize=CGSizeMake(656, 0);
    scr.contentOffset = CGPointMake(0, 0);
    scr.scrollEnabled = YES;
    scr.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:scr];
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 656, 40)];
    view.userInteractionEnabled=YES;
    view.backgroundColor=[UIColor whiteColor];
    [scr addSubview:view];
    view.layer.borderWidth=1;
    view.layer.borderColor=[color_line2 CGColor];
    for (int i=1; i<8; i++) {
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(82*i, 0, 1, 40)];
        line.backgroundColor=color_line2;
        [view addSubview:line];
    }
    for (int i=0; i<8; i++) {
        UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(82*i, 0, 82, 40)];
        btn.tag=i;
        [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"hao" forState:UIControlStateNormal];
        [btn setTitleColor:color_line1 forState:UIControlStateNormal];
        [btn setTitleColor:color_line2 forState:UIControlStateHighlighted];
        [view addSubview:btn];
    }
    _underline=[[UILabel alloc] initWithFrame:CGRectMake(0, 35, 82, 5)];
    _underline.backgroundColor=maincolor;
    [view addSubview:_underline];
    return scr;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==1) {
        return 180;
    }else{
        return 100;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    //2.从缓存池中取出可循环利用的cell
    XuanShangTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //3.如果缓存池中没有可循环利用的cell
    if (cell ==nil ){
        cell=[[XuanShangTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    if (indexPath.row==1) {
        [cell setIcon:@"head60-60" Name:@"我是小可爱" sendTime:@"12月12号 19:30" mainLable:@"送快递" detil:@"帮忙那个快递中通" moneyLable:@"酬谢 5.00元" locationLable:@"木兰苑1幢3单元" img1:@"img68-68" img2:@"img68-68" img3:@"img68-68"];
    }else{
        [cell setIcon:@"head60-60" Name:@"我是小可爱" sendTime:@"12月12号 19:30" mainLable:@"送快递" detil:@"帮忙那个快递中通" moneyLable:@"酬谢 5.00元" locationLable:@"木兰苑1幢3单元" img1:@"" img2:@"" img3:@""];
    }
    if (indexPath.row%2==0) {
        [cell setMainLable:color_tag2];
    }else
    {
        [cell setMainLable:color_tag1];
    }
    cell.backgroundColor=bgcolor;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_myTableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row==1) {
        XuanshangDetilViewController *Vc=[[XuanshangDetilViewController alloc] initWithActDetilType:@"1"];
        Vc.view.backgroundColor=bgcolor;
        Vc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:Vc animated:YES];

    }else{
        XuanshangDetilViewController *Vc=[[XuanshangDetilViewController alloc] initWithActDetilType:@"0"];
        Vc.view.backgroundColor=bgcolor;
        Vc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:Vc animated:YES];

    }
}
@end
