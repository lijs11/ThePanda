//
//  KKTitleScrollView.h
//  banTangSuger
//
//  Created by Kenny.li on 16/5/30.
//  Copyright © 2016年 KK. All rights reserved.


/** 参考别人的例子  http://www.jianshu.com/p/258f4efd7a1d/comments/421134 */

/********************************************************************************
 
1.titleView自由滑动 高度需要自己设定下，默认45，标签中间对齐，大了或者小了需要进去改
2.有导航栏,需要设置 self.automaticallyAdjustsScrollViewInsets = NO; 不然ScrollView位置总出错
3.标签去掉弹簧效果 设置 self.scrollView.bounces = NO;
 
**********************************************************************************/


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class KKTitleScrollView;
@protocol KKTitleScrollViewDelegate <NSObject>
@optional
- (void)titleScrollViewDidClicked:(KKTitleScrollView *)titleScrollView atIndex:(NSInteger)index;
@end


@interface KKTitleScrollView : UIView

/**外部设置，选中哪个标签*/
- (void)selectItemAtIndex:(NSInteger)index;

/**初始化方法*/
- (instancetype)initWithTitleArray:(NSArray *)titleArray titleSubWidth:(CGFloat)subWidth;

/**更新方法，一定要初始化alloc以后才用*/
- (void)updateSubViewsWithTitleArray:(NSArray *)titleArray titleSubWidth:(CGFloat)subWidth;



@property (nonatomic,weak) id<KKTitleScrollViewDelegate> delegate;

@end
