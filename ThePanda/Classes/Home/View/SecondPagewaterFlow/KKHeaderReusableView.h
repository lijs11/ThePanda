//
//  KKHeaderReusableView.h
//  banTangSuger
//
//  Created by Kenny.li on 16/7/4.
//  Copyright © 2016年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKBtnMore.h"
#import "KKHots.h"
#import "UIButton+ImageTitleSpacing.h"
@interface KKHeaderReusableView : UICollectionReusableView


@property (nonatomic,strong)UIView      *headerView;
@property (nonatomic,strong)UILabel     *textLabel;
@property (nonatomic,strong)UIImageView *imageV;

@property (nonatomic,strong)KKBtnMore    *btn;

@property (nonatomic,strong)UIImageView *btnImage;



@property (nonatomic,strong)KKHots *hot;

@property (nonatomic,strong)UINavigationController *navgationCC;

@end
