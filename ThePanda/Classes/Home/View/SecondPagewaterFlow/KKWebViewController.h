//
//  KKWebViewController.h
//  小帮手
//
//  Created by Kenny.li on 16/5/17.
//  Copyright (c) 2016年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKItems.h"


@interface KKWebViewController : UIViewController

@property (nonatomic,copy) NSString *urlStr;

@property (nonatomic,strong)KKItems *item;



@end
