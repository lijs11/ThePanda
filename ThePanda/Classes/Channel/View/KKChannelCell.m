//
//  KKChannelCell.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/28.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKChannelCell.h"

@interface KKChannelCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *LabelT;

@end

@implementation KKChannelCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
 
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 2;
        
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
//        self.layer.borderColor = [UIColor redColor].CGColor;
//        self.layer.borderWidth = 0.2;
        
//        //显示不完全是模拟器不是100% 大小
        self.contentView.layer.borderWidth = 0.3;
        self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
    }
    return self;
}




- (void)setTitle:(KKTitles *)title{
    _title = title;
    
    self.LabelT.text = title.cname;
    if (title.img) {
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:title.img]];
    }
    
    
    
}
@end
