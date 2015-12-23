//
//  SecondSectionCell.h
//  liubangzhu
//
//  Created by pengsu on 15/12/22.
//  Copyright © 2015年 able. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZRBSYModel;

@interface ZRBSecondSectionCell : UITableViewCell

@property (nonatomic,strong) UIImageView *imageIcon;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *tagImage;
@property (nonatomic,strong) UILabel *tagLabel;
@property (nonatomic,strong) UIImageView                                                     *personIcon;
@property (nonatomic,strong) UILabel *personLabel;
@property (nonatomic,strong) UIImageView *dianzanImage;
@property (nonatomic,strong) UILabel *dianzanLabel;

@property (nonatomic,strong) ZRBSYModel *model;
@end
