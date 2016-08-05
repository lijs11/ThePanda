//
//  HomeCollectionCell.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//


/***************************
 首页除了第一页，其他页面
 ***************************/

#import <UIKit/UIKit.h>
#import "KKNewFlowView.h"
@interface HomeCollectionCell : UICollectionViewCell
//hots
@property (nonatomic,copy) NSString *titleenName;
@property (nonatomic,assign) NSInteger selectedItem;

@property (nonatomic,strong) KKNewFlowView *sameFlowView;

@property (nonatomic,strong)UINavigationController *navgationCC;

@end
