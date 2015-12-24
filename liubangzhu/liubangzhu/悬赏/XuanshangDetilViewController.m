//
//  XuanshangDetilViewController.m
//  liubangzhu
//
//  Created by able on 15/12/23.
//  Copyright © 2015年 able. All rights reserved.
//

#import "XuanshangDetilViewController.h"

@interface XuanshangDetilViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy) NSString *type;
@property(nonatomic,strong) UIView *headerView;
@property(nonatomic,strong) UIView *TBheaderView;
@property(nonatomic,strong) UIView *centerView;
@property(nonatomic,strong) UITableView *myTableView;

@end

@implementation XuanshangDetilViewController

- (instancetype)initWithActDetilType:(NSString *)aType
{
    if (self = [super init])
    {
        _type = aType;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self SettableViewHeaderView];
    _myTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWith, KScreenHeigh-49) style:UITableViewStylePlain];
    _myTableView.delegate=self;
    _myTableView.dataSource=self;
    _myTableView.tableHeaderView=_TBheaderView;
    [self.view addSubview:_myTableView];
    [self SetClickbtn];
    
    
}
-(void)setNav
{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.text = @"详情";
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = color_line1;
    self.navigationItem.titleView = titleLabel;
    
    UIButton *leftBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setImage:[UIImage imageNamed:@"icon44-44"] forState:UIControlStateNormal];
    UIBarButtonItem *customButton = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = customButton;
    
    UIButton *rightbtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightbtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [rightbtn setImage:[UIImage imageNamed:@"icon44-44"] forState:UIControlStateNormal];
    UIBarButtonItem *systemButton = [[UIBarButtonItem alloc]initWithCustomView:rightbtn];
    self.navigationItem.rightBarButtonItem = systemButton;
    
}
-(void)setHeaderView
{
    
    _headerView=[[UIView alloc] init];
    _headerView.backgroundColor=[UIColor whiteColor];
    [_TBheaderView addSubview:_headerView];
    _headerView.layer.borderColor=[color_line2 CGColor];
    _headerView.layer.borderWidth=0.5;
    if ([_type isEqualToString:@"0"]) {
        _headerView.frame=CGRectMake(0, 0, KScreenWith, 240);
    }else{
        _headerView.frame=CGRectMake(0, 0, KScreenWith, 320);
    }
    
    UIImageView *icon=[[UIImageView alloc] initWithFrame:CGRectMake(12, 10, 60, 60)];
    icon.image=[UIImage imageNamed:@"head60-60"];
    [_headerView addSubview:icon];
    
    UILabel *name=[[UILabel alloc] initWithFrame:CGRectMake(12, 72, 60, 11)];
    name.text=@"荒野嫖客";
    name.textAlignment=NSTextAlignmentCenter;
    name.textColor=color_txt1;
    name.font=[UIFont systemFontOfSize:11];
    [_headerView addSubview:name];
    
    UILabel *sendTime=[[UILabel alloc] initWithFrame:CGRectMake(94, 12, 160, 11)];
    sendTime.textColor=color_line2;
    sendTime.font=[UIFont systemFontOfSize:11];
    sendTime.text=@"12月12日 19:30";
    [_headerView addSubview:sendTime];
    
    UILabel *mainLable=[[UILabel alloc] initWithFrame:CGRectMake(KScreenWith-55, 0, 55, 25)];
    mainLable.backgroundColor=color_tag3;
    mainLable.text=@"取快递";
    mainLable.textAlignment=NSTextAlignmentCenter;
    mainLable.font=[UIFont systemFontOfSize:11];
    [_headerView addSubview:mainLable];
    
    UILabel *detil=[[UILabel alloc] initWithFrame:CGRectMake(94, 38, KScreenWith-94-12, 13)];
    detil.textColor=color_txt1;
    detil.text=@"帮忙那块地";
    detil.font=[UIFont systemFontOfSize:13];
    [_headerView addSubview:detil];
    
    UIImageView *moneyImg=[[UIImageView alloc] init];
    moneyImg.image=[UIImage imageNamed:@"icon20-20"];
    [_headerView addSubview:moneyImg];
    UIImageView *locationImg=[[UIImageView alloc] init];
    locationImg.image=[UIImage imageNamed:@"icon20-20"];
    [_headerView addSubview:locationImg];
    UILabel *money=[[UILabel alloc] init];
    money.text=@"酬谢 5.00元";
    money.textColor=color_line1;
    money.font=[UIFont systemFontOfSize:11];
    [_headerView addSubview:money];
    UILabel *location=[[UILabel alloc] init];
    location.text=@"东河家园5幢3单元";
    location.textColor=color_line1;
    location.font=[UIFont systemFontOfSize:11];
    [_headerView addSubview:location];
    UILabel *XQLable=[[UILabel alloc] init];
    XQLable.textColor=color_txt1;
    XQLable.font=[UIFont systemFontOfSize:15];
    XQLable.text=@"详情:";
    [_headerView addSubview:XQLable];
    UILabel *xiangqing=[[UILabel alloc] init];
    xiangqing.text=@"帮忙那个快递\n谢谢哈\naaaaaaaa\n帮忙那个快递\n谢谢哈\naaaaaaaa\n帮忙那个快递";
    xiangqing.textColor=color_txt1;
    xiangqing.font=[UIFont systemFontOfSize:13];
    xiangqing.numberOfLines=0;
    [xiangqing sizeToFit];
    [_headerView addSubview:xiangqing];
    
    if ([_type isEqualToString:@"0"]) {
        moneyImg.frame=CGRectMake(94, 61, 20, 20);
        money.frame=CGRectMake(116, 65, 80, 11);
        locationImg.frame=CGRectMake(198, 61, 20, 20);
        location.frame=CGRectMake(220, 65, KScreenWith-220-10, 11);
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 90, KScreenWith, 0.5)];
        line.backgroundColor=color_line2;
        [_headerView addSubview:line];
        XQLable.frame=CGRectMake(12, 100, 50, 15);
        xiangqing.frame=CGRectMake(12, 120, KScreenWith-24, 110);
    }else{
        UIImageView *img1=[[UIImageView alloc] initWithFrame:CGRectMake(94, 61, 68, 68)];
        UIImageView *img2=[[UIImageView alloc] initWithFrame:CGRectMake(167, 61, 68, 68)];
        UIImageView *img3=[[UIImageView alloc] initWithFrame:CGRectMake(240, 61, 68, 68)];
        [_headerView addSubview:img1];
        [_headerView addSubview:img2];
        [_headerView addSubview:img3];
        img1.image=[UIImage imageNamed:@"img68-68"];
        img2.image=[UIImage imageNamed:@"img68-68"];
        img3.image=[UIImage imageNamed:@"img68-68"];
        moneyImg.frame=CGRectMake(94, 139, 20, 20);
        money.frame=CGRectMake(116, 143, 80, 11);
        locationImg.frame=CGRectMake(198, 139, 20, 20);
        location.frame=CGRectMake(220, 143, KScreenWith-220-10, 11);
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 170, KScreenWith, 0.5)];
        line.backgroundColor=color_line2;
        [_headerView addSubview:line];
        XQLable.frame=CGRectMake(12, 180, 50, 15);
        xiangqing.frame=CGRectMake(12, 200, KScreenWith-24, 110);
    }
    
}
-(void)setZhuangtai
{
    _centerView=[[UIView alloc] init];
    _centerView.backgroundColor=[UIColor whiteColor];
    _centerView.layer.borderColor=[color_line2 CGColor];
    _centerView.layer.borderWidth=0.5;
    [_TBheaderView addSubview:_centerView];
    if ([_type isEqualToString:@"0"]) {
        _centerView.frame=CGRectMake(0, 250, KScreenWith, 124);
    }else{
        _centerView.frame=CGRectMake(0, 330, KScreenWith, 124);
    }
    UIImageView *watchImg=[[UIImageView alloc] initWithFrame:CGRectMake(12, 7, 30, 30)];
    watchImg.image=[UIImage imageNamed:@"icon30-30"];
    [_centerView addSubview:watchImg];
    UILabel *lable1=[[UILabel alloc] initWithFrame:CGRectMake(47, 0, 90, 44)];
    lable1.text=@"任务截止时间:";
    lable1.font=[UIFont systemFontOfSize:14];
    lable1.textColor=color_txt1;
    [_centerView addSubview:lable1];
    UILabel *endTime=[[UILabel alloc] initWithFrame:CGRectMake(140, 0, KScreenWith-152, 44)];
    endTime.font=[UIFont systemFontOfSize:14];
    endTime.textColor=color_txt1;
    endTime.text=@"12月12日 12:30";
    [_centerView addSubview:endTime];
    
    UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 44, KScreenWith, 0.5)];
    line.backgroundColor=color_line2;
    [_centerView addSubview:line];
    
    for (int i=0; i<4; i++) {
        UILabel *circle=[[UILabel alloc] initWithFrame:CGRectMake(15+(40+(KScreenWith-190)/3)*i, 56, 40, 40)];
        circle.layer.cornerRadius=20;
        circle.layer.borderColor=[maincolor CGColor];
        circle.layer.borderWidth=2;
        [_centerView addSubview:circle];
    }
    for (int i=0; i<3; i++) {
        UILabel *line=[[UILabel alloc] initWithFrame:CGRectMake(55+(40+(KScreenWith-190)/3)*i, 75, (KScreenWith-190)/3, 2)];
        line.backgroundColor=color_line2;
        [_centerView addSubview:line];
    }
    UILabel *celectV=[[UILabel alloc] initWithFrame:CGRectMake(23, 64, 24, 24)];
    celectV.layer.cornerRadius=12;
    celectV.clipsToBounds=YES;
    celectV.backgroundColor=maincolor;
    [_centerView addSubview:celectV];
    
    for (int i=0; i<4; i++) {
        NSArray *array=@[@"已发布",@"有人申请",@"正在进行",@"搞定啦"];
        UILabel *ztLable=[[UILabel alloc] initWithFrame:CGRectMake(10+(40+(KScreenWith-190)/3)*i, 103, 50, 11)];
        ztLable.text=array[i];
        ztLable.textColor=color_txt1;
        ztLable.textAlignment=NSTextAlignmentCenter;
        ztLable.font=[UIFont systemFontOfSize:11];
        [_centerView addSubview:ztLable];
        
    }

    
    
}
-(void)SettableViewHeaderView
{
    if ([_type isEqualToString:@"0"]) {
        _TBheaderView=[[UIView alloc] initWithFrame:CGRectMake(0, 64, KScreenWith, 384)];
    }else{
        _TBheaderView=[[UIView alloc] initWithFrame:CGRectMake(0, 64, KScreenWith, 464)];
    }
    _TBheaderView.backgroundColor=bgcolor;
    [self.view addSubview:_TBheaderView];
    [self setHeaderView];
    [self setZhuangtai];
    

}
-(void)SetClickbtn
{
    UIView *View=[[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeigh-49, KScreenWith, 49)];
    View.layer.borderColor=[color_line2 CGColor];
    View.layer.borderWidth=0.5;
    [self.view addSubview:View];
    UIButton *leftBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, KScreenWith*2/5, 49)];
    leftBtn.backgroundColor=[UIColor whiteColor];
    [View addSubview:leftBtn];
    UIButton *rightBtn=[[UIButton alloc] initWithFrame:CGRectMake(KScreenWith*2/5, 0, KScreenWith*3/5, 49)];
    rightBtn.backgroundColor=maincolor;
    [View addSubview:rightBtn];
    
    UIView *view1=[[UIView alloc] initWithFrame:CGRectMake(KScreenWith/5-31, 0, 62, 49)];
    [leftBtn addSubview:view1];
    UIImageView *img1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 9.5, 30, 30)];
    img1.image=[UIImage imageNamed:@"icon30-30"];
    [view1 addSubview:img1];
    UILabel *lable1=[[UILabel alloc] initWithFrame:CGRectMake(32, 0, 30, 49)];
    lable1.font=[UIFont systemFontOfSize:15];
    lable1.textColor=color_txt1;
    lable1.text=@"评论";
    [view1 addSubview:lable1];
    
    UIView *view2=[[UIView alloc] initWithFrame:CGRectMake(KScreenWith*3/10-38.5, 0, 77, 49)];
    [rightBtn addSubview:view2];
    UIImageView *img2=[[UIImageView alloc] initWithFrame:CGRectMake(0, 9.5, 30, 30)];
    img2.image=[UIImage imageNamed:@"icon30-30"];
    [view2 addSubview:img2];
    UILabel *lable2=[[UILabel alloc] initWithFrame:CGRectMake(32, 0, 45, 49)];
    lable2.font=[UIFont systemFontOfSize:15];
    lable2.textColor=[UIColor whiteColor];
    lable2.text=@"帮帮他";
    [view2 addSubview:lable2];


    

    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *View=[[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWith, 44)];
    UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(12, 7, 30, 30)];
    img.image=[UIImage imageNamed:@"icon30-30"];
    [View addSubview:img];
    UILabel *lable=[[UILabel alloc] initWithFrame:CGRectMake(47, 0, 100, 44)];
    lable.textColor=color_txt1;
    lable.text=@"评论";
    lable.font=[UIFont systemFontOfSize:14];
    [View addSubview:lable];
    View.layer.borderColor=[color_line2 CGColor];
    View.layer.borderWidth=0.5;
    View.backgroundColor=[UIColor whiteColor];
    return View;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    //2.从缓存池中取出可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //3.如果缓存池中没有可循环利用的cell
    if (cell ==nil ){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text=@"hao";
    return cell;
}
-(void)leftBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightBtnClick
{
    
}

@end
