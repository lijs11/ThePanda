//
//  KKSubChannelViewController.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/28.
//  Copyright © 2016年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKNewFlowView.h"

@interface KKSubChannelViewController : UIViewController

@property (nonatomic,copy) NSString *titleenName;
@property (nonatomic,copy) NSString *titlecnName;
@property (nonatomic,assign) NSInteger selectedItem;

@property (nonatomic,strong) KKNewFlowView *sameFlowView;


@end
