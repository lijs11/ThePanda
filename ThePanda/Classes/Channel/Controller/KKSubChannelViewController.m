//
//  KKSubChannelViewController.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/28.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKSubChannelViewController.h"
#import "HomeCollectionCell.h"

@interface KKSubChannelViewController ()




@end

@implementation KKSubChannelViewController


- (KKNewFlowView *)sameFlowView{
    
    if (_sameFlowView == nil) {
        self.sameFlowView = [[KKNewFlowView alloc] init];
        self.sameFlowView.frame = CGRectMake(0, 5, HMScreenW, self.view.height);
        [self.view addSubview:self.sameFlowView];
    }
    return _sameFlowView;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
   
    
    
}

- (void)setTitleenName:(NSString *)titleenName{
    
    _titleenName = titleenName;
    
    self.sameFlowView.titleenName = titleenName;
    
    //  self.bgVV.alpha = 0.0;
    
}

- (void)setTitlecnName:(NSString *)titlecnName{
    
    _titlecnName = titlecnName;
    
    self.navigationItem.title = titlecnName;
    
    
}


- (void)setSelectedItem:(NSInteger)selectedItem{
    
    _selectedItem = selectedItem;
    self.sameFlowView.selectedItem = selectedItem;
    
}



@end
