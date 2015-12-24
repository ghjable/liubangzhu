//
//  NSString+Extension.m
//  葛洪杰
//
//  Created by able on 15/7/20.
//  Copyright (c) 2015年 able. All rights reserved.
//

#import "NSString+Extension.h"
@implementation NSString (Extension)
//计算字体的size
-(CGSize)sizeWithMaxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize
{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
}
@end
