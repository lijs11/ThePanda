//
//  KKLiveViewController.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/22.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKLiveViewController.h"
#import "KKHots.h"
#import "SVProgressHUD.h"

@interface KKLiveViewController ()
/**英文的titleNameS*/
@property (nonatomic,strong)NSMutableArray *titleenNamesArray;
/**首页分类*/
@property (nonatomic,strong)NSMutableArray *titles;

/**首页分类*/
@property (nonatomic,strong)NSMutableArray *hots;

@end

@implementation KKLiveViewController

#pragma mark - 懒加载
- (NSMutableArray *)titles{
    if (_titles == nil) {
        self.titles = [NSMutableArray array];
    }
    return _titles;
}


- (NSMutableArray *)titleenNamesArray{
    if (_titleenNamesArray == nil) {
        self.titleenNamesArray = [NSMutableArray array];
    }
    return _titleenNamesArray;
}

- (NSMutableArray *)hots{
    if (_hots == nil) {
        self.hots = [NSMutableArray array];
    }
    return _hots;
}



- (KKNewFlowView *)sameFlowView{
    
    if (_sameFlowView == nil) {
        self.sameFlowView = [[KKNewFlowView alloc] init];
        //self.sameFlowView.frame = CGRectMake(0, 5, HMScreenW, self.view.height);
        [self.view addSubview:self.sameFlowView];
    }
    return _sameFlowView;
}





#pragma mark - 初始化

- (void)viewDidLoad {
    [super viewDidLoad];
  //  self.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_logo"]];
    
    
    [self.sameFlowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(5);
        make.leading.trailing.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
    
    //告诉子控件 这是直播页面 子控件自己判断 加载
    self.sameFlowView.isLivingOtherHots = YES;
    
   
}





//- (void)setTitleenName:(NSString *)titleenName{
//    
//    _titleenName = titleenName;
//    
//    self.sameFlowView.titleenName = titleenName;
//    
//    //  self.bgVV.alpha = 0.0;
//    
//}

//- (void)setTitlecnName:(NSString *)titlecnName{
//    
//    _titlecnName = titlecnName;
//    
//    self.navigationItem.title = titlecnName;
//    
//    
//}


//- (void)setSelectedItem:(NSInteger)selectedItem{
//    
//    _selectedItem = selectedItem;
//    self.sameFlowView.selectedItem = selectedItem;
//    
//}













@end
