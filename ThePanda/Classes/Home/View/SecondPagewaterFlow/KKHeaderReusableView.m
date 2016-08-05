//
//  KKHeaderReusableView.m
//  banTangSuger
//
//  Created by Kenny.li on 16/7/4.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKHeaderReusableView.h"
#import "KKSubChannelViewController.h"

@implementation KKHeaderReusableView





- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
       
        _headerView = [[UIView alloc] init];
        [self addSubview:_headerView];
        
        _imageV = [[UIImageView alloc] init];
        [_imageV setImage:[UIImage imageNamed:@"home_more"]] ;
        [self addSubview:_imageV];
        
        
        _textLabel = [[UILabel alloc] init];
        _textLabel.text = @"穿越火线";
        _textLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_textLabel];
        
//        
//        _btn = [[KKBtnMore alloc] init];
//      //  [_btn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:2];
//        [self addSubview:_btn];
//        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        _btn = [[KKBtnMore alloc] init];
        _btn.titleLabel.font = [UIFont systemFontOfSize:11];
        
        
       // _btn.titleLabel.textColor = [UIColor grayColor];
       // _btn.backgroundColor = [UIColor  redColor];
       // _btn.frame = CGRectMake(200, 0, 60, 15);
        
        //下面不是home more 图片的
//        _btn.imageView.contentMode = UIViewContentModeScaleAspectFill;
//        [_btn setTintColor:[UIColor grayColor]];
//        [_btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
//        _btn.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 5, -40);
//        _btn.titleEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
//        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:_btn];
        _btn.imageView.contentMode = UIViewContentModeCenter;
        [_btn setTintColor:[UIColor grayColor]];
        [_btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        // _btn.frame = CGRectMake(200, 0, 60, 15);
        _btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -40);
        _btn.titleEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn];

        
        [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
           // make.edges.equalTo(self);
            make.bottom.leading.trailing.mas_equalTo(self).offset(-5);
            make.height.mas_equalTo(20);
            
        }];
        
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_headerView);
            make.leading.mas_equalTo(_headerView).offset(15);
            make.width.height.mas_equalTo(20);
        }];
        
        [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_headerView);
            make.leading.mas_equalTo(_imageV).offset(25);
            make.width.mas_equalTo(240);
        }];
        
        
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_headerView);
            make.trailing.mas_equalTo(_headerView).offset(10);
            make.width.mas_equalTo(60);
        }];
        
                
       
    }
    return self;
}



- (void)setHot:(KKHots *)hot{
    
    _hot = hot;
    self.textLabel.text = hot.type.cname;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:hot.type.icon] placeholderImage:[UIImage imageNamed:@"home_more"]];
    
}


- (void)btnClick:(KKBtnMore *)btn{
    
    NSLogg(@"moreBtnClick");
    
    if ([self.hot.type.ename isEqualToString:@"hot"]) {
        //[UIView animateWithDuration:1.0 animations:^{
            [self.navgationCC.tabBarController setSelectedIndex:2];
       // }];
        
        
    }else{
        
    KKSubChannelViewController *subVc = [[KKSubChannelViewController alloc] init];
    [self.navgationCC presentViewController:subVc animated:YES completion:nil];
    
    subVc.selectedItem = 100;
    subVc.titleenName = self.hot.type.ename;
    subVc.titlecnName = self.hot.type.cname;
        
    }
    
    
}



@end
