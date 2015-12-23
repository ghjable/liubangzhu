//
//  SecondSectionCell.m
//  liubangzhu
//
//  Created by pengsu on 15/12/22.
//  Copyright © 2015年 able. All rights reserved.
//

#import "ZRBSecondSectionCell.h"
#import "ZRBSYModel.h"


@implementation ZRBSecondSectionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview: self.imageIcon];
        [self.contentView addSubview: self.titleLabel];
        [self.contentView addSubview: self.tagImage];
        [self.contentView addSubview: self.tagLabel];
        [self.contentView addSubview: self.personIcon];
        [self.contentView addSubview: self.personLabel];
        [self.contentView addSubview:self.dianzanImage];
        [self.contentView addSubview:self.dianzanLabel];
    }
    return self;
}

- (UIImageView *)imageIcon {
    if (!_imageIcon) {
        self.imageIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 355, 160)];
    }
    return _imageIcon;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 182, 351, 38)];
    }
    return _titleLabel;
}

- (UIImageView *)tagImage {
    if (!_tagImage) {
        self.tagImage = [[UIImageView alloc] initWithFrame:CGRectMake(12, 215, 20, 20)];
    }
    return _tagImage;
}

- (UILabel *)tagLabel {
    if (!_tagLabel) {
        self.tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(32, 215, 50, 20)];
    }
    return _tagLabel;;
}

- (UIImageView *)personIcon {
    if (!_personIcon) {
        self.personIcon = [[UIImageView alloc] initWithFrame:CGRectMake(96, 215, 20, 20)];
    }
    return _personIcon;
}

- (UILabel *)personLabel {
    if (!_personLabel) {
        self.personLabel = [[UILabel alloc] initWithFrame:CGRectMake(116, 215, 100, 20)];
    }
    return _personLabel;
}

- (UIImageView *)dianzanImage {
    if (!_dianzanImage) {
        self.dianzanImage = [[UIImageView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width - 62 - 20, 215, 20, 20)];
    }
    return _dianzanImage;
}

- (UILabel *)dianzanLabel {
    if (!_dianzanLabel) {
        self.dianzanLabel = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width - 62, 215, 50, 20)];
    }
    return _dianzanLabel;
}

- (void)setModel:(ZRBSYModel *)model {
    if (_model != model) {
        _model = model;
    }
    self.imageIcon.image = [UIImage imageNamed:@"img355-160"];
    self.titleLabel.text = @"2016三校区TOP10投票开始啦";
    self.tagImage.image = [UIImage imageNamed:@"icon20-20"];
    self.tagLabel.text = @"校园";
    self.personIcon.image = [UIImage imageNamed:@"icon20-20"];
    self.personLabel.text = @"校学生会";
    self.dianzanImage.image = [UIImage imageNamed:@"icon20-20"];
    self.dianzanLabel.text = @"326";
}

@end
