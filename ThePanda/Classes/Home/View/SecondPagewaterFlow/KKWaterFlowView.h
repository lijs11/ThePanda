//
//  KKWaterFlowView.h
//  banTangSuger
//
//  Created by Kenny.li on 16/7/3.
//  Copyright © 2016年 KK. All rights reserved.
//

/*************************
 首页 第一页 热门推荐cell里的View
 *************************/

#import <UIKit/UIKit.h>
#import "KKHots.h"
#import "KKImageScroller.h"
@interface KKWaterFlowView : UIView

@property (nonatomic,strong)UICollectionView *collectView;
@property (nonatomic,strong)KKImageScroller *headImageScView;

//ImagesSc数据
@property (nonatomic,strong) NSMutableArray *newsArray;




/**waterFlow分类*/
@property (nonatomic,strong)NSMutableArray *hots;

@property (nonatomic,strong)UINavigationController *navgationCC;

@end
