//
//  HeaderCell.m
//  liubangzhu
//
//  Created by pengsu on 15/12/22.
//  Copyright © 2015年 able. All rights reserved.
//

#import "HeaderCell.h"
#import "SDCycleScrollView.h"

@interface  HeaderCell ()

@end

@implementation HeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.headerView];
    }
    return self;
}

- (UIView *)headerView {
    if (!_headerView) {
        self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 120)];
        
    }
    return _headerView;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
