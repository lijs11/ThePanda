//
//  HomeFirstViewCell.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//  第一页 没有用到的

#import <UIKit/UIKit.h>
#import "KKFirstPage.h"
#import "KKImages.h"
#import "KKHots.h"
#import "KKImageScroller.h"

@interface HomeFirstViewCell : UICollectionViewCell

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong)KKImageScroller *headImageScView;

//ImagesSc
@property (nonatomic,strong) NSMutableArray *newsArray;
//hots
@property (nonatomic,strong) NSMutableArray *hots;


//记录是第几个row,用于存储
@property (nonatomic,assign) NSInteger row;
@property (nonatomic,strong)UINavigationController *navCC;

@end
