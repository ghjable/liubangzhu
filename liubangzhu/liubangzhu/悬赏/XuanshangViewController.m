//
//  XuanshangViewController.m
//  liubangzhu
//
//  Created by able on 15/12/21.
//  Copyright © 2015年 able. All rights reserved.
//

#import "XuanshangViewController.h"
#import "XuanShangTableViewCell.h"
@interface XuanshangViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIScrollView *_scrollView1;

}
@property(nonatomic,copy) NSString *Str1;
@property(nonatomic,copy) NSString *Str2;
@property(nonatomic,copy) NSString *Str3;
@property(nonatomic,strong) UITableView *myTableView;


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
    _scrollView1 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 120)];
    _scrollView1.showsHorizontalScrollIndicator=NO;
    _scrollView1.showsVerticalScrollIndicator=NO;
    _scrollView1.bounces=NO;
    [self.view addSubview:_scrollView1];
    _Str1=@"img355-160";
    _Str2=@"img355-210";
    _Str3=@"img375-120";
    NSArray *array=[NSArray arrayWithObjects:_Str3,_Str1,_Str2,_Str3,_Str1, nil];
    
    // 添加图片
    for (int i=0; i<array.count; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, 120)];
        //        [imageView sd_setImageWithURL:[NSURL URLWithString:array[i]]];
        imageView.image=[UIImage imageNamed:array[i]];
        [_scrollView1 addSubview:imageView];
        //        imageView.tag=i+10;
        //        imageView.userInteractionEnabled=YES;
        //        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        //        tap.numberOfTapsRequired=1;
        //        tap.numberOfTouchesRequired=1;
        //        [imageView addGestureRecognizer:tap];
        
        
    }
    _scrollView1.contentOffset = CGPointMake( [UIScreen mainScreen].bounds.size.width, 0);
    //tag
    _scrollView1.tag = 2000;
    _scrollView1.contentSize = CGSizeMake( [UIScreen mainScreen].bounds.size.width * array.count, 0);
    _scrollView1.pagingEnabled = YES;
    _scrollView1.delegate = self;
    [self.view addSubview:_scrollView1];
    //UIPageControl
    //实例化
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-300)/2, 160, 300, 24)];
    
    //    pageControl.backgroundColor = [UIColor purpleColor];
    //设置点点的个数
    pageControl.numberOfPages = array.count-2;
    //设置默认第几个点
    pageControl.currentPage = 0;
    //设置选中前点点的颜色
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    //设置选中后点点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    //事件
    [pageControl addTarget:self action:@selector(pageControl:) forControlEvents:UIControlEventValueChanged];
    
    //tag
    pageControl.tag = 1000;
    _scrollView1.pagingEnabled=YES;
    [self.view addSubview:pageControl];
    //定时器
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
    _myTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, KScreenWith, KScreenHeigh-64-49) style:UITableViewStylePlain];
    _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _myTableView.delegate=self;
    _myTableView.dataSource=self;
    _myTableView.tableHeaderView=_scrollView1;
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
    NSLog(@"right");
}


-(void)BtnClick:(UIButton *)btn
{
    
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
        btn.tag=i+1;
        [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"hao" forState:UIControlStateNormal];
        [btn setTitleColor:color_line1 forState:UIControlStateNormal];
        [view addSubview:btn];
    }
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

@end
