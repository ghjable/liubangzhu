//
//  PublishViewController.m
//  liubangzhu
//
//  Created by able on 15/12/23.
//  Copyright © 2015年 able. All rights reserved.
//

#import "PublishViewController.h"

@interface PublishViewController ()<UITextFieldDelegate,UIScrollViewDelegate>
@property(nonatomic,strong) UIView *View1;
@property(nonatomic,strong) UIView *View2;
@property(nonatomic,strong) UIView *View3;
@property(nonatomic,strong) UITextField *titleTF;
@property(nonatomic,strong) UITextField *money1TF;
@property(nonatomic,strong) UITextField *money2TF;
@property(nonatomic,strong) UITextField *LoactionTF;
@property(nonatomic,strong) UITextField *TelPhoneTF;
@property(nonatomic,strong) UITextField *FuliTF;
@property(nonatomic,strong) UIScrollView *myScrollView;
@property(nonatomic,strong) UITextView *detileTV;


@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWith, KScreenHeigh)];
    _myScrollView.delegate=self;
    _myScrollView.contentSize=CGSizeMake(0, 608);
    _myScrollView.contentOffset=CGPointMake(0, 0);
    [self.view addSubview:_myScrollView];
    
    [self setNav];
    [self setTitle];
    [self setMoney];
    [self setOther];
    UIButton *publishBtn=[[UIButton alloc] initWithFrame:CGRectMake(12, 548, KScreenWith-24, 49)];
    publishBtn.backgroundColor=maincolor;
    publishBtn.layer.cornerRadius=4;
    [publishBtn addTarget:self action:@selector(publishBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [publishBtn setTitle:@"发布" forState:UIControlStateNormal];
    [_myScrollView addSubview:publishBtn];
    
    //有scrollview的时候 要使键盘点击空白隐藏
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchScrollView)];
    [recognizer setNumberOfTapsRequired:1];
    [recognizer setNumberOfTouchesRequired:1];
    [_myScrollView addGestureRecognizer:recognizer];

    
    
}
-(void)setNav
{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.text = @"发布";
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
-(void)setTitle
{
    _View1=[[UIView alloc] initWithFrame:CGRectMake(0, 10, KScreenWith, 190)];
    _View1.backgroundColor=[UIColor whiteColor];
    _View1.layer.borderColor=[color_line2 CGColor];
    _View1.layer.borderWidth=0.5;
    [_myScrollView addSubview:_View1];
    
    UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(12, 15, 30, 13)];
    title.text=@"标题";
    title.font=[UIFont systemFontOfSize:13];
    title.textColor=color_txt1;
    [_View1 addSubview:title];
    _titleTF=[[UITextField alloc] initWithFrame:CGRectMake(42, 0, 220, 43)];
    _titleTF.font=[UIFont systemFontOfSize:12];
    _titleTF.delegate=self;
    _titleTF.placeholder=@"请用一句话介绍您的任务,18字以内";
    [_View1 addSubview:_titleTF];
    UIView *line=[[UIView alloc] initWithFrame:CGRectMake(12, 43, KScreenWith-24, 0.5)];
    line.backgroundColor=color_line2;
    [_View1 addSubview:line];
    
    UILabel *detile=[[UILabel alloc] initWithFrame:CGRectMake(12, 58, 30, 13)];
    detile.textColor=color_txt1;
    detile.font=[UIFont systemFontOfSize:13];
    detile.text=@"详情";
    [_View1 addSubview: detile];
    _detileTV=[[UITextView alloc] initWithFrame:CGRectMake(42, 50, KScreenWith-42-12, 60)];
    _detileTV.font=[UIFont systemFontOfSize:12];
    [_View1 addSubview:_detileTV];
    UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(12, 118, 60, 60)];
    img.image=[UIImage imageNamed:@"icon60-60"];
    [_View1 addSubview:img];

}
-(void)setMoney
{
    _View2=[[UIView alloc] initWithFrame:CGRectMake(0, 210, KScreenWith, 88)];
    _View2.backgroundColor=[UIColor whiteColor];
    _View2.layer.borderColor=[color_line2 CGColor];
    _View2.layer.borderWidth=0.5;
    [_myScrollView addSubview:_View2];
    
    UILabel *LB1=[[UILabel alloc] initWithFrame:CGRectMake(KScreenWith-12-12, 0, 12, 44)];
    LB1.textColor=color_txt1;
    LB1.text=@"元";
    LB1.font=[UIFont systemFontOfSize:12];
    [_View2 addSubview:LB1];
    
    UILabel *lable1=[[UILabel alloc] initWithFrame:CGRectMake(12, 0, 100, 44)];
    lable1.textColor=color_txt1;
    lable1.text=@"打赏金额";
    lable1.font=[UIFont systemFontOfSize:13];
    [_View2 addSubview:lable1];
    
    _money1TF=[[UITextField alloc] initWithFrame:CGRectMake(120, 0, KScreenWith-12-10-12-120, 44)];
    _money1TF.font=[UIFont systemFontOfSize:12];
    _money1TF.textAlignment=NSTextAlignmentRight;
    _money1TF.delegate=self;
    _money1TF.keyboardType=UIKeyboardTypeNumberPad;
    _money1TF.placeholder=@"请输入给对方的酬劳,最少1元";
    [_View2 addSubview:_money1TF];
    
    UIView *line=[[UIView alloc] initWithFrame:CGRectMake(12, 44, KScreenWith-24, 0.5)];
    line.backgroundColor=color_line2;
    [_View2 addSubview:line];
    
    UILabel *lable2=[[UILabel alloc] initWithFrame:CGRectMake(12, 44, 100, 44)];
    lable2.textColor=color_txt1;
    lable2.text=@"代买预付(选填)";
    lable2.font=[UIFont systemFontOfSize:13];
    [_View2 addSubview:lable2];
    
    UILabel *LB2=[[UILabel alloc] initWithFrame:CGRectMake(KScreenWith-12-12, 44, 12, 44)];
    LB2.textColor=color_txt1;
    LB2.text=@"元";
    LB2.font=[UIFont systemFontOfSize:12];
    [_View2 addSubview:LB2];
    
    _money2TF=[[UITextField alloc] initWithFrame:CGRectMake(120, 44, KScreenWith-12-10-12-120, 44)];
    _money2TF.font=[UIFont systemFontOfSize:12];
    _money2TF.delegate=self;
    _money2TF.keyboardType=UIKeyboardTypeNumberPad;
    _money2TF.textAlignment=NSTextAlignmentRight;
    _money2TF.placeholder=@"请输入代买商品的价格";
    [_View2 addSubview:_money2TF];
    
}
-(void)setOther
{
    _View3=[[UIView alloc] initWithFrame:CGRectMake(0, 308, KScreenWith, 220)];
    _View3.backgroundColor=[UIColor whiteColor];
    _View3.layer.borderColor=[color_line2 CGColor];
    _View3.layer.borderWidth=0.5;
    [_myScrollView addSubview:_View3];
    for (int i=1; i<5; i++) {
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(12, 44*i, KScreenWith-24, 0.5)];
        line.backgroundColor=color_line2;
        [_View3 addSubview:line];
    }
    NSArray *array=@[@"标签",@"任务截止时间",@"交接地址",@"联系方式",@"福利(选填)"];
    for (int i=0; i<5; i++) {
        UILabel *lable=[[UILabel alloc] initWithFrame:CGRectMake(12, 44*i, 100, 44)];
        lable.text=array[i];
        lable.font=[UIFont systemFontOfSize:13];
        lable.textColor=color_txt1;
        [_View3 addSubview:lable];
    }
    for (int i=0; i<2; i++) {
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(KScreenWith-37, 9+i*44, 25, 25)];
        img.image=[UIImage imageNamed:@"icon25-25"];
        [_View3 addSubview:img];
    }
    UILabel *Biaoqian=[[UILabel alloc] initWithFrame:CGRectMake(120, 0, KScreenWith-120-37, 44)];
    Biaoqian.textAlignment=NSTextAlignmentRight;
    Biaoqian.font=[UIFont systemFontOfSize:12];
    Biaoqian.text=@"请选择类型标签";
    [_View3 addSubview:Biaoqian];
    
    UILabel *Shijian=[[UILabel alloc] initWithFrame:CGRectMake(120, 44, KScreenWith-120-37, 44)];
    Shijian.textAlignment=NSTextAlignmentRight;
    Shijian.font=[UIFont systemFontOfSize:12];
    Shijian.text=@"请选择截止时间";
    [_View3 addSubview:Shijian];
    
    _LoactionTF=[[UITextField alloc] initWithFrame:CGRectMake(120, 44*2, KScreenWith-120-12, 44)];
    _LoactionTF.textAlignment=NSTextAlignmentRight;
    _LoactionTF.textColor=color_txt1;
    _LoactionTF.delegate=self;
    _LoactionTF.font=[UIFont systemFontOfSize:12];
    _LoactionTF.placeholder=@"请输入交接地点,如东九-206";
    [_View3 addSubview:_LoactionTF];
    
    _TelPhoneTF=[[UITextField alloc] initWithFrame:CGRectMake(120, 44*3, KScreenWith-120-12, 44)];
    _TelPhoneTF.textAlignment=NSTextAlignmentRight;
    _TelPhoneTF.textColor=color_txt1;
    _TelPhoneTF.delegate=self;
    _TelPhoneTF.keyboardType=UIKeyboardTypeNumberPad;
    _TelPhoneTF.font=[UIFont systemFontOfSize:12];
    _TelPhoneTF.placeholder=@"13758257323";
    [_View3 addSubview:_TelPhoneTF];

    _FuliTF=[[UITextField alloc] initWithFrame:CGRectMake(120, 44*4, KScreenWith-120-12, 44)];
    _FuliTF.textAlignment=NSTextAlignmentRight;
    _FuliTF.textColor=color_txt1;
    _FuliTF.delegate=self;
    _FuliTF.font=[UIFont systemFontOfSize:12];
    _FuliTF.placeholder=@"您可以赠送额外的福利,如:”和你聊聊“";
    [_View3 addSubview:_FuliTF];

    
}
#pragma mark--点击空白处隐藏键盘 (有scrollview的时候)
- (void)touchScrollView
{
    [self.titleTF resignFirstResponder];
    [self.money1TF resignFirstResponder];
    [self.money2TF resignFirstResponder];
    [self.TelPhoneTF resignFirstResponder];
    [self.LoactionTF resignFirstResponder];
    [self.FuliTF resignFirstResponder];
    [self.detileTV resignFirstResponder];
}
-(void)leftBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightBtnClick
{
    
}
-(void)publishBtnClick
{
    
}
@end
