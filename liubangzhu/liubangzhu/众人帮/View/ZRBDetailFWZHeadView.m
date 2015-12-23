//
//  ZRBDetailFWZHeadView.m
//  liubangzhu
//
//  Created by pengsu on 15/12/23.
//  Copyright © 2015年 able. All rights reserved.
//

#import "ZRBDetailFWZHeadView.h"

@interface ZRBDetailFWZHeadView ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *dataLabel;
@property (nonatomic,strong) UIView *line;
@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) UILabel *summaryLabel;
@property (nonatomic,strong) UILabel *activityDataLabel;
@property (nonatomic,strong) UILabel *locationLabel;
@property (nonatomic,strong) UILabel *ticketLabel;

@end

@implementation ZRBDetailFWZHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.dataLabel];
        [self addSubview:self.line];
        [self addSubview:self.iconImage];
        [self addSubview:self.summaryLabel];
        [self addSubview:self.activityDataLabel];
        [self addSubview:self.locationLabel];
        [self addSubview:self.ticketLabel];
    }
    return self;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        
    }
    return _titleLabel;
}

- (UILabel *)dataLabel {
    if (!_dataLabel) {
        
    }
    return _dataLabel;
}

- (UIView *)line {
    if (!_line) {
        
    }
    return _line;
}

- (UILabel *)summaryLabel {
    if (!_summaryLabel) {
        
    }
    return _summaryLabel;
}

- (UILabel *)activityDataLabel {
    if (!_activityDataLabel) {
        
    }
    return _activityDataLabel;
}

- (UILabel *)locationLabel {
    if (!_locationLabel) {
        
    }
    return _locationLabel;
}

- (UILabel *)ticketLabel {
    if (!_ticketLabel) {
        
    }
    return _ticketLabel;
}

@end
