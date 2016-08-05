//
//  KKBtnMore.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/26.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKBtnMore.h"

@implementation KKBtnMore

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
     //   self.backgroundColor = [UIColor redColor];
        
       
//        _headerView = [[UIView alloc] init];
//        [self addSubview:_headerView];
//       
        
//        _imageV = [[UIImageView alloc] init];
//        [_imageV setImage:[UIImage imageNamed:@"home_more"]] ;
//        [self addSubview:_imageV];
//        
//        
//        _textLabel = [[UILabel alloc] init];
//        _textLabel.text = @"更多";
//        _textLabel.font = [UIFont systemFontOfSize:13];
//        _textLabel.textColor = [UIColor grayColor];
//        [self addSubview:_textLabel];
//        
//        
       
        
//        [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
//            // make.edges.equalTo(self);
//            make.bottom.leading.trailing.mas_equalTo(self);
//            make.height.mas_equalTo(20);
//            
//        }];
//
//        [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.bottom.equalTo(_headerView);
//            make.trailing.mas_equalTo(_imageV).offset(-6);
//            make.width.mas_equalTo(40);
//        }];
//        
//        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(_headerView);
//            make.trailing.mas_equalTo(_headerView);
//            make.width.height.mas_equalTo(13);
//        }];
//     
        [self setTitle:@"更多" forState:UIControlStateNormal];
       // [self setImage:[UIImage imageNamed:@"my_arrows_normal"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"home_more"] forState:UIControlStateNormal];
       
        
     //   self.textLabel.font = [UIFont systemFontOfSize:5];
       // self.textLabel.textColor = [UIColor grayColor];
        
    }
    return self;
}


//- (void)layoutSubviews{
//    
//    self.textLabel.font = [UIFont systemFontOfSize:15];
//    self.textLabel.textColor = [UIColor grayColor];
//    
//    
//}




@end
