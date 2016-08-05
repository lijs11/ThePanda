//
//  ListModel.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/22.
//  Copyright © 2016年 KK. All rights reserved.
//


#import "ListModel.h"
#import "MJExtension.h"
@implementation ListModel
{
    CGFloat _cellHeight;
}
-(CGFloat)cellHeight{
    
    if (!_cellHeight) {
        
        CGFloat width=[UIScreen mainScreen].bounds.size.width-20;
        _cellHeight=10+40+10+width+10;
    }
    return _cellHeight;
}
@end
