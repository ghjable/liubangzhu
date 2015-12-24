//
//  XuanshangCommentTableViewCell.h
//  liubangzhu
//
//  Created by able on 15/12/24.
//  Copyright © 2015年 able. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XuanshangCommentTableViewCell : UITableViewCell
@property(nonatomic,strong) UIImageView *icon;
@property(nonatomic,strong) UILabel *name;
@property(nonatomic,strong) UILabel *sendTime;
@property(nonatomic,strong) UILabel *detil;


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
