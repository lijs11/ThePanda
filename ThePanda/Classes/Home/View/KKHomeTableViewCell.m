//
//  KKHomeTableViewCell.m
//  banTangSuger
//
//  Created by Kenny.li on 16/6/2.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKHomeTableViewCell.h"
#import "UIImageView+WebCache.m"
@implementation KKHomeTableViewCell

- (void)awakeFromNib {
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

- (void)setItem:(KKItems *)item
{
    _item = item;
    
    NSString *img = item.pictures[@"img"];
    [self.bgImage sd_setImageWithURL:[NSURL URLWithString:img] placeholderImage:nil];
    self.title.text = item.name;
    self.likeLabel.text = item.fans;
    
    
}


- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    CGRect theFrame = frame;
    theFrame = CGRectMake(frame.origin.x, frame.origin.y, HMScreenH, frame.size.height);
    
}







@end
