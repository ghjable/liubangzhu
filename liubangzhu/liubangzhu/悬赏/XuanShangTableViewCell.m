//
//  XuanShangTableViewCell.m
//  liubangzhu
//
//  Created by able on 15/12/22.
//  Copyright © 2015年 able. All rights reserved.
//

#import "XuanShangTableViewCell.h"

@implementation XuanShangTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _bgView=[[UIView alloc] init];
        _bgView.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:_bgView];
        
        _icon=[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        _icon.layer.cornerRadius=30;
        _icon.clipsToBounds=YES;
        [_bgView addSubview:_icon];
        
        _sendTime=[[UILabel alloc] initWithFrame:CGRectMake(90, 12, 200, 11)];
        _sendTime.textAlignment=NSTextAlignmentLeft;
        _sendTime.textColor=color_line1;
        _sendTime.font=[UIFont systemFontOfSize:11];
        [_bgView addSubview:_sendTime];
        
        _name=[[UILabel alloc] initWithFrame:CGRectMake(10, 73, 60, 11)];
        _name.font=[UIFont systemFontOfSize:11];
        _name.textColor=color_txt1;
        _name.textAlignment=NSTextAlignmentCenter;
        [_bgView addSubview:_name];
        
        _mainLable=[[UILabel alloc] initWithFrame:CGRectMake(KScreenWith-20-55, 0, 55, 25)];
        _mainLable.textColor=[UIColor whiteColor];
        _mainLable.font=[UIFont systemFontOfSize:11];
        _mainLable.textAlignment=NSTextAlignmentCenter;
        [_bgView addSubview:_mainLable];
        
        _detil=[[UILabel alloc] initWithFrame:CGRectMake(90, 38, KScreenWith-20-100, 13)];
        _detil.font=[UIFont systemFontOfSize:13];
        _detil.textColor=color_txt1;
        [_bgView addSubview:_detil];
        
        _moneyImg=[[UIImageView alloc] initWithFrame:CGRectMake(90, 59, 20, 20)];
        [_bgView addSubview:_moneyImg];
        _moneyLable=[[UILabel alloc] initWithFrame:CGRectMake(113, 64, 76, 11)];
        _moneyLable.textColor=color_line1;
        _moneyLable.font=[UIFont systemFontOfSize:11];
        [_bgView addSubview:_moneyLable];
        
        _locationImg=[[UIImageView alloc] initWithFrame:CGRectMake(192, 59, 20, 20)];
        [_bgView addSubview:_locationImg];
        _locationLable=[[UILabel alloc] initWithFrame:CGRectMake(215, 64, KScreenWith-20-215-10, 11)];
        _locationLable.textColor=color_line1;
        _locationLable.font=[UIFont systemFontOfSize:11];
        [_bgView addSubview:_locationLable];
        
        _img1=[[UIImageView alloc] initWithFrame:CGRectMake(90, 64, 68, 68)];
        [_bgView addSubview:_img1];
        _img2=[[UIImageView alloc] initWithFrame:CGRectMake(163, 64, 68, 68)];
        [_bgView addSubview:_img2];
        _img3=[[UIImageView alloc] initWithFrame:CGRectMake(236, 64, 68, 68)];
        [_bgView addSubview:_img3];
        
        
    }
    return self;
}
-(void)setIcon:(NSString *)aName Name:(NSString *)bName sendTime:(NSString *)cName mainLable:(NSString *)dName detil:(NSString *)eName moneyLable:(NSString *)fName locationLable:(NSString *)gName img1:(NSString *)img1 img2:(NSString *)img2 img3:(NSString *)img3
{
    if ([img1 isEqualToString:@""]) {
        _bgView.frame=CGRectMake(10, 5, KScreenWith-20, 90);
        _icon.image=[UIImage imageNamed:aName];
        _name.text=bName;
        _sendTime.text=cName;
        _mainLable.text=dName;
        _detil.text=eName;
        _moneyImg.image=[UIImage imageNamed:@"icon20-20"];
        _moneyLable.text=fName;
        _locationImg.image=[UIImage imageNamed:@"icon20-20"];
        _locationLable.text=gName;
    }else{
        _bgView.frame=CGRectMake(10, 5, KScreenWith-20, 170);
        _icon.image=[UIImage imageNamed:aName];
        _name.text=bName;
        _sendTime.text=cName;
        _mainLable.text=dName;
        _detil.text=eName;
        _img1.image=[UIImage imageNamed:img1];
        _img2.image=[UIImage imageNamed:img2];
        _img3.image=[UIImage imageNamed:img3];
        _moneyImg.frame=CGRectMake(90, 142, 20, 20);
        _moneyImg.image=[UIImage imageNamed:@"icon20-20"];
        _moneyLable.frame=CGRectMake(113, 147, 76, 11);
        _moneyLable.text=fName;
        _locationImg.frame=CGRectMake(192, 142, 20, 20);
        _locationImg.image=[UIImage imageNamed:@"icon20-20"];
        _locationLable.frame=CGRectMake(215, 147, KScreenWith-20-215-10, 11);
        _locationLable.text=gName;
    }
}
-(void)setMainLable:(UIColor *)mainLablecolor
{
    _mainLable.backgroundColor=mainLablecolor;
}
@end
