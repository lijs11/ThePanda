//
//  KKNewFlowView.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/28.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKNewFlowView.h"
#import "KKWaterFlowCell.h"
#import "KKHeaderReusableView.h"
#import "KKWebViewController.h"

#import "KKFirstPage.h"
#import "KKImages.h"
#import "SVProgressHUD.h"
#import "ShowLivingViewController.h"

@interface KKNewFlowView()<UICollectionViewDataSource,UICollectionViewDelegate>

/**内部数据源*/
@property (nonatomic,strong)NSMutableArray *hots;
@property (nonatomic,assign) NSInteger pageno;
@end


@implementation KKNewFlowView


- (NSMutableArray *)hots{
    
    if (_hots == nil) {
        self.hots = [NSMutableArray array];
    }
    
    return _hots;
}


/*UIcollectionView 懒加载**/
- (UICollectionView *)collectView{
    if (_collectView == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
        layout.itemSize = CGSizeMake(HMScreenW / 2 - 7.5,100);
        //        layout.itemSize = CGSizeMake(self.view.width, 5 * 250);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        //        layout.headerReferenceSize = CGSizeZero;
        //        layout.footerReferenceSize = CGSizeZero;
        
        self.collectView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        self.collectView.pagingEnabled = NO;
        self.collectView.backgroundColor = [UIColor whiteColor];
        self.collectView.delegate = self;
        self.collectView.dataSource = self;
        //self.collectView.bounces = NO;//默认YES 滑动效果
        self.collectView.showsHorizontalScrollIndicator = NO;
        
        //self.collectView.scrollEnabled = NO;
        //注册cell
        [self.collectView registerNib:[UINib nibWithNibName:@"KKWaterFlowCell" bundle:nil] forCellWithReuseIdentifier:@"KKWaterFlowID"];
        //注册Header
        [self.collectView registerClass:[KKHeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        
    }
    
    return _collectView;
}




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
        //1.collectView
        [self addSubview:self.collectView];
        
        [self.collectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        
       MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
        self.collectView.mj_header = header;
        
       MJRefreshAutoFooter *footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
      self.collectView.mj_footer = footer;
      
      // self.collectView.mj_footer.hidden = YES;
     // [self.collectView.mj_footer endRefreshingWithNoMoreData];
      // self.collectView.mj_footer.automaticallyHidden = YES;
        
    }
    return self;
}

#pragma mark - UICollectionView--Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return self.hots.count;

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (self.hots.count == 0) {
        return 0;
    }else{
        KKHots *hot = self.hots[section];
        return hot.items.count;
    }
   
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    KKWaterFlowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"KKWaterFlowID" forIndexPath:indexPath];
    if (self.hots.count > 0) {
        KKHots *hot = self.hots[indexPath.section];
        KKItems *item = hot.items[indexPath.item];
        cell.item = item;
    }
    
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return self.collectView.bounds.size;
//}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section

{
    
    return UIEdgeInsetsMake(2.5, 5, 2.5, 5);//分别为上、左、下、右
    
}




- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    KKHots *hot = self.hots[indexPath.section];
    KKItems *item = hot.items[indexPath.item];
    
 
//    LiveRoomViewController *vc = [[LiveRoomViewController alloc] init];
//    vc.roomid = [item.id integerValue];
//    [self.navgationCC presentViewController:vc animated:YES completion:^{
//        
//    }];
    
    ShowLivingViewController * show=[[ShowLivingViewController alloc]init];
    show.item = item;
    show.hidesBottomBarWhenPushed=YES;
    [self.navgationCC pushViewController:show animated:YES];
    
   
    
    
}



- (void)refreshHeader{
    
    if (self.isLivingOtherHots == NO) {
        self.pageno = 0;
        
        [self getCategoryDataWithName:self.titleenName];
    }else{
        
         [self getOtherHotsData];
    }
    
    
}
- (void)refreshFooter{
    
    if (self.isLivingOtherHots == NO) {
    [self getCategoryDataWithName:self.titleenName];
    }

}

#pragma mark - 主要用来判断并设置主页
- (void)getCategoryDataWithName:(NSString *)titleenName{
    
    if (!titleenName || self.selectedItem == 0){//不是collection其他页，条件不满足，返回
        //停止刷新
        if (self.collectView.mj_header.isRefreshing) {
            [self.collectView.mj_header endRefreshing];
        }
        
        if (self.collectView.mj_footer.isRefreshing) {
            [self.collectView.mj_footer endRefreshing];
        }
        return;
    }
    
    
    
    
     //NSLogg(@"getCategoryDataWithName--%@",titleenName);
        
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        
        NSString *url = @"http://api.m.panda.tv/ajax_get_live_list_by_cate";
        
      //  __channel=appstore&__plat=ios&__version=1.0.14.1190&cate=lol&order=person_num&pageno=1&pagenum=10&status=2
        
 
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        param[@"__channel"]= @"appstore";
        param[@"__plat"]= @"ios";
        param[@"__version"]= @"1.0.14.1190";
        param[@"cate"]= titleenName;
        self.pageno  = self.pageno + 1;
        NSString *pageNo = [NSString stringWithFormat:@"%ld",(long)self.pageno];
        param[@"pageno"]= pageNo;
        param[@"pagenum"]= @"10";
        param[@"status"]= @"2";
        
        
        
        [HMHttpTool post:url parameters:param success:^(id json) {
            
            
            if (!self.collectView.mj_footer.isRefreshing) {
                [self.hots removeAllObjects];
            }
            
            //1.只有一个值
            KKHots *hot = [KKHots mj_objectWithKeyValues: json[@"data"]];
         //   NSDictionary *dic = json[@"data"];
           // NSLogg(@"%@",dic.keyValues);
            
            [self.hots addObject:hot];
            
            if (hot.items.count == 0) {
                
                if (self.pageno > 0) {
                   self.pageno  = self.pageno - 1;
                }else{
                    self.pageno  = 0;
                }
                
               
                [SVProgressHUD setMinimumDismissTimeInterval:1.0];
                [SVProgressHUD showInfoWithStatus:@"好像没有直播了哦!"];
                
            }
            
            
            //2.设置Data
           [self.collectView reloadData];
            
            
            //3.停止刷新
            if (self.collectView.mj_header.isRefreshing) {
                [self.collectView.mj_header endRefreshing];
            }
            
            if (self.collectView.mj_footer.isRefreshing) {
                [self.collectView.mj_footer endRefreshing];
            }
           // NSLog(@"%ld",(long)self.pageno);
        } failure:^(NSError *error) {
            
            //3.停止刷新
            if (self.collectView.mj_header.isRefreshing) {
                [self.collectView.mj_header endRefreshing];
            }
            
            if (self.collectView.mj_footer.isRefreshing) {
                [self.collectView.mj_footer endRefreshing];
            }
            
            [SVProgressHUD setMinimumDismissTimeInterval:1.0];
            [SVProgressHUD showInfoWithStatus:@"加载失败，请检查网络!"];
            
            NSLogg(@"getData--error %@",error);
            self.pageno  = self.pageno - 1;
        }];
    });
    
}


//首页的CollectionView 自动加载
- (void)setTitleenName:(NSString *)titleenName{
    
    _titleenName = titleenName;
   // NSLogg(@"setTitleenName--%@",titleenName);
    
    self.pageno = 0;
    [self getCategoryDataWithName:titleenName];
    // [self.collectView.mj_header beginRefreshing];
}

//直播页的CollectionView 自动加载
- (void)setIsLivingOtherHots:(BOOL)isLivingOtherHots{
    _isLivingOtherHots = isLivingOtherHots;
    
    if (self.isLivingOtherHots) {
         [self getOtherHotsData];
    }
   
}


- (void)setOtherHots:(NSArray *)otherHots{
    
    _otherHots = otherHots;
    
    if (otherHots.count > 0) {
        [self.hots removeAllObjects];
        [self.hots addObjectsFromArray:otherHots];
        [self.collectView reloadData];
    }
    
}

- (void)getOtherHotsData{
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        
        NSString *url = @"http://api.m.panda.tv/ajax_live_lists";
        // __channel=appstore&__plat=ios&__version=1.0.14.1190&order=person_num&pageno=1&pagenum=10&status=2
        
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        param[@"__channel"]= @"appstore";
        param[@"__plat"]= @"ios";
        param[@"__version"]= @"1.0.14.1190";
        param[@"order"]= @"person_num";
        param[@"pageno"]= @"1";
        param[@"pagenum"]= @"20";
        param[@"status"]= @"2";
        
        
        NSMutableArray *liveHots = [NSMutableArray array];
        
        [HMHttpTool post:url parameters:param success:^(id json) {
            
            KKHots *hot = [KKHots mj_objectWithKeyValues: json[@"data"]];
            [liveHots addObject:hot];
            
            if ([hot.total isEqualToNumber:@0]) {
                
                [SVProgressHUD setMinimumDismissTimeInterval:1.0];
                [SVProgressHUD showInfoWithStatus:@"好像没有直播哦!"];
                
            }
            
            //2.设置Data
            self.otherHots = liveHots;
            
            //停止刷新
            if (self.collectView.mj_header.isRefreshing) {
                [self.collectView.mj_header endRefreshing];
            }
            
            if (self.collectView.mj_footer.isRefreshing) {
                [self.collectView.mj_footer endRefreshing];
            }
                        
        } failure:^(NSError *error) {
            //停止刷新
            if (self.collectView.mj_header.isRefreshing) {
                [self.collectView.mj_header endRefreshing];
            }
            
            if (self.collectView.mj_footer.isRefreshing) {
                [self.collectView.mj_footer endRefreshing];
            }
            
            [SVProgressHUD setMinimumDismissTimeInterval:1.0];
            [SVProgressHUD showInfoWithStatus:@"加载失败，请检查网络!"];
            
            NSLogg(@"getData--error %@",error);
            
        }];
    });
    
}




@end
