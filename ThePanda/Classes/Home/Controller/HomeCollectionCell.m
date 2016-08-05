//
//  HomeCollectionCell.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "HomeCollectionCell.h"


@interface HomeCollectionCell()
@property (nonatomic,strong)UIView *bgVV;
@end
@implementation HomeCollectionCell




- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
               
        _sameFlowView = [[KKNewFlowView alloc] init];
        _sameFlowView.frame = CGRectMake(0, 5, HMScreenW, self.height);
        [self addSubview:_sameFlowView];
//
//        UIView *bgVV = [[UIView alloc] initWithFrame:CGRectMake(HMScreenW / 2 - 50, HMScreenH / 5 , 100, 120)];
//        bgVV.backgroundColor = [UIColor whiteColor];
//        bgVV.alpha = 1;
//        [self addSubview:bgVV];
//        self.bgVV = bgVV;
//        
//        UIImageView *imageV = [[UIImageView alloc] init];
//        imageV.frame = CGRectMake(0, 0, 100, 100);
//        imageV.image = [UIImage imageNamed:@"panda1"];
//        [bgVV addSubview:imageV];
//        
//        UILabel *label = [[UILabel alloc] init];
//        label.frame = CGRectMake(0, 100, 100, 20);
//        label.text = @"正在努力加载中...";
//        label.font = [UIFont systemFontOfSize:10];
//        label.textAlignment = NSTextAlignmentCenter;
//        [bgVV addSubview:label];
//        
        
        
        
    }
    return self;
}


- (void)setTitleenName:(NSString *)titleenName{
    
    _titleenName = titleenName;
    
    //告诉不是直播页面
    _sameFlowView.isLivingOtherHots = NO;
    _sameFlowView.titleenName = titleenName;
    
  //  self.bgVV.alpha = 0.0;
    
}

- (void)setSelectedItem:(NSInteger)selectedItem{
    
    _selectedItem = selectedItem;
    _sameFlowView.selectedItem = selectedItem;
    
}

- (void)setNavgationCC:(UINavigationController *)navgationCC{
    _navgationCC = navgationCC;
    self.sameFlowView.navgationCC = navgationCC;
}


@end
