//
//  XuanShangTableViewCell.h
//  liubangzhu
//
//  Created by able on 15/12/22.
//  Copyright © 2015年 able. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XuanShangTableViewCell : UITableViewCell
@property(nonatomic,strong) UIView *bgView;
@property(nonatomic,strong) UIImageView *icon;
@property(nonatomic,strong) UILabel *name;
@property(nonatomic,strong) UILabel *sendTime;
@property(nonatomic,strong) UILabel *mainLable;
@property(nonatomic,strong) UILabel *detil;
@property(nonatomic,strong) UIImageView *moneyImg;
@property(nonatomic,strong) UIImageView *locationImg;
@property(nonatomic,strong) UILabel *moneyLable;
@property(nonatomic,strong) UILabel *locationLable;
@property(nonatomic,strong) UIImageView *img1;
@property(nonatomic,strong) UIImageView *img2;
@property(nonatomic,strong) UIImageView *img3;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

-(void)setIcon:(NSString *)aName Name:(NSString *)bName sendTime:(NSString *)cName mainLable:(NSString *)dName detil:(NSString *)eName moneyLable:(NSString *)fName locationLable:(NSString *)gName img1:(NSString *)img1 img2:(NSString *)img2 img3:(NSString *)img3;
-(void)setMainLable:(UIColor *)mainLablecolor;
 @end
