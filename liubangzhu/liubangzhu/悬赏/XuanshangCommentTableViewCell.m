//
//  XuanshangCommentTableViewCell.m
//  liubangzhu
//
//  Created by able on 15/12/24.
//  Copyright © 2015年 able. All rights reserved.
//

#import "XuanshangCommentTableViewCell.h"
#import "NSString+Extension.h"
@implementation XuanshangCommentTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _icon=[[UIImageView alloc] initWithFrame:CGRectMake(12, 10, 50, 50)];
        [self.contentView addSubview:_icon];
        
        _name=[[UILabel alloc] init];
        _name.textColor=color_line1;
        _name.font=[UIFont systemFontOfSize:15];
        [self.contentView addSubview:_name];
        
        CGSize size1=[_name.text sizeWithMaxSize:CGSizeMake(200, 15) fontSize:15];
        _sendTime=[[UILabel alloc] initWithFrame:CGRectMake(76+size1.width+15, 20, KScreenWith-(76+size1.width+15)-12, 11)];
        _sendTime.font=[UIFont systemFontOfSize:11];
        _sendTime.textColor=color_line2;
        [self.contentView addSubview:_sendTime];
        
        _detil=[[UILabel alloc] init];
        _detil.font=[UIFont systemFontOfSize:13];
        _detil.textColor=color_txt1;
        [self.contentView addSubview:_detil];
    }
    return self;
}

@end
