//
//  KKNewFlowView.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/28.
//  Copyright © 2016年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KKNewFlowView : UIView

//首页以后页面
@property (nonatomic,copy) NSString *titleenName;
/**第几个item，必填项，缺省为0，代表选的第一个*/
@property (nonatomic,assign) NSInteger selectedItem;


//直播页面
/**外部赋值*/
@property (nonatomic,strong)NSArray *otherHots;
/**外部赋值是否是直播页，必填项*/
@property (nonatomic,assign)BOOL isLivingOtherHots;



@property (nonatomic,strong)UICollectionView *collectView;
@property (nonatomic,strong)UINavigationController *navgationCC;

@end
