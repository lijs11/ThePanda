//
//  ShowLivingViewController.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/22.
//  Copyright © 2016年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKItems.h"
@class ListModel;
@interface ShowLivingViewController : UIViewController
/** ListModel */
@property(nonatomic,strong)ListModel * model;


@property (nonatomic,strong)KKItems *item;



@end
