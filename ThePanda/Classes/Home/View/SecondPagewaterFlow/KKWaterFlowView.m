//
//  KKWaterFlowView.m
//  banTangSuger
//
//  Created by Kenny.li on 16/7/3.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKWaterFlowView.h"
#import "KKWaterFlowCell.h"
#import "KKHeaderReusableView.h"
#import "KKWebViewController.h"

#import "KKFirstPage.h"
#import "KKImages.h"
#import "SVProgressHUD.h"
#import "ShowLivingViewController.h"

@interface KKWaterFlowView()<UICollectionViewDataSource,UICollectionViewDelegate,KKImageScrollerDelegate>

/**头部*/
@property (nonatomic,strong) KKHeaderReusableView *headerView;
@property (nonatomic,strong) UIView *testView;

//内部刷新存入头部滚动数据
@property (nonatomic,strong)NSMutableArray *headNewsArray;

//内部CollectionView数据
@property (nonatomic,strong)NSMutableArray *insideHots;


//状态图片，正在加载
@property (nonatomic,strong)UIView *bgVV;
@property (nonatomic,assign) BOOL isAddBgVV;




@end

@implementation KKWaterFlowView

//headNewsArray
- (NSMutableArray *)headNewsArray{
    if (_headNewsArray == nil) {
        self.headNewsArray = [NSMutableArray array];
    }
    return _headNewsArray;
}
//headNewsArray
- (NSMutableArray *)insideHots{
    if (_insideHots == nil) {
        self.insideHots = [NSMutableArray array];
    }
    return _insideHots;
}


- (UIView *)bgVV{
    
    if (_bgVV == nil) {
        UIView *bgVV = [[UIView alloc] initWithFrame:CGRectMake(HMScreenW / 2 - 50, HMScreenH / 3 , 100, 140)];
        bgVV.backgroundColor = [UIColor whiteColor];
        bgVV.alpha = 1;
       // [self addSubview:bgVV];
        self.bgVV = bgVV;
        
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.frame = CGRectMake(0, 0, 100, 110);
        imageV.image = [UIImage imageNamed:@"panda1"];
        [bgVV addSubview:imageV];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 120, 100, 20);
        label.text = @"正在努力加载中...";
        label.font = [UIFont systemFontOfSize:10];
        label.textAlignment = NSTextAlignmentCenter;
        [bgVV addSubview:label];
    }
    return _bgVV;
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
        
        
        //添加自动刷新
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
        header.ignoredScrollViewContentInsetTop = 210;
        self.collectView.mj_header = header;
        
//        MJRefreshAutoFooter *footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
//        self.collectView.mj_footer = footer;
        
        
        
    }
    
    return _collectView;
}




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        //1.testView
//        UIView *testView = [[UIView alloc] init];
//        self.testView = testView;
//        testView.backgroundColor = [UIColor redColor];
//        [self.collectView addSubview:self.testView];
        
        _headImageScView = [[KKImageScroller alloc] init];
        _headImageScView.delegate = self;
        //_headImageScView.frame = CGRectMake(0, 0, HMScreenW, 210);
        [self.collectView addSubview:_headImageScView];
        
        
        
        //2.collectView
        [self addSubview:self.collectView];
        self.collectView.contentInset = UIEdgeInsetsMake(210, 0, 0, 0);
        
        
        
        //3.布局
//        [self.testView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.collectView.mas_top).offset(-150);
//            make.leading.trailing.equalTo(self.collectView);
//            make.width.mas_equalTo(HMScreenW);
//            make.height.mas_equalTo(150);
//        }];
        
        [_headImageScView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.collectView.mas_top).offset(-210);
            make.leading.trailing.equalTo(self.collectView);
            make.width.mas_equalTo(HMScreenW);
            make.height.mas_equalTo(210);
        }];
        
        
        [self.collectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
     
        
        
        [self.collectView.mj_header beginRefreshing];
        
    }
    return self;
}

#pragma mark - UICollectionView--Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return self.hots.count;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    KKHots *hot = self.hots[section];
    return hot.items.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    KKWaterFlowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"KKWaterFlowID" forIndexPath:indexPath];
    KKHots *hot = self.hots[indexPath.section];
    KKItems *item = hot.items[indexPath.item];
    cell.item = item;
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return self.collectView.bounds.size;
//}




//分组标题
- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader)
    {
        KKHeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        self.headerView = headerView;
        reusableview = headerView;
        
        //用于navgationCC传值
        headerView.navgationCC = self.navgationCC;
        
        KKHots *hot = self.hots[indexPath.section];
        headerView.hot = hot;
    }
    
    return reusableview;
}
//分组标题
-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(HMScreenW,50);
    
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    KKWebViewController *wbeVc = [[KKWebViewController alloc] init];
//    [self.navgationCC pushViewController:wbeVc animated:YES];
//    
//    
    KKHots *hot = self.hots[indexPath.section];
    KKItems *item = hot.items[indexPath.item];
   
    
    ShowLivingViewController * show=[[ShowLivingViewController alloc]init];
    show.item = item;
    show.hidesBottomBarWhenPushed=YES;
    [self.navgationCC pushViewController:show animated:YES];
    
}


- (void)imageScroller:(KKImageScroller *)imageScroller didClickedAtIndex:(NSInteger)index{
    
    
    //提取 Image URL
    NSMutableArray *picArray = [NSMutableArray array];
    if (self.newsArray.count >= 1) {
        
        KKFirstPage *firstpage = self.newsArray[0];
        [picArray addObject:firstpage.url];
        
        [self.newsArray removeObjectAtIndex:0];
        
        for (KKImages *imageM in self.newsArray) {
            [picArray addObject:imageM.url];
        }
        
    }
    
  //  picArray[index];
    
    
    ShowLivingViewController * show=[[ShowLivingViewController alloc]init];
   // show.item = item;
    show.hidesBottomBarWhenPushed=YES;
    [self.navgationCC pushViewController:show animated:YES];
}



#pragma mark - Data

//first Hello 女神 第一张图片
- (void)getFirstScPic{
    
    
    //加一个背景View
    if (self.isAddBgVV == NO) {
        [self addSubview:self.bgVV];
        self.isAddBgVV = YES;
    }
    
    
    //first Hello 女神 第一张图片
    [self.headNewsArray removeAllObjects];
    
    NSString *helloUrl = @"http://static.api.m.panda.tv/index.php?method=clientconf.cooperateconf&__version=1.0.14.1190&__plat=ios&__channel=appstore";
    [HMHttpTool get:helloUrl parameters:nil success:^(id json) {
        //首页图片
        for (NSArray *array in json[@"data"]) {
            KKFirstPage *firstPage = [KKFirstPage mj_objectWithKeyValues:array];
            [self.headNewsArray addObject:firstPage];
        }
        [self getOtherScPic];
        
    } failure:^(NSError *error) {
        
        NSLogg(@"first Hello 女神 error--%@",error);
    }];
    
    
}


//ImageSc 后续图片
- (void)getOtherScPic{
    
    //ImageSc 后续图片
    NSString *imageScUrl = @"http://api.m.panda.tv/ajax_rmd_ads_get?__version=1.0.14.1190&__plat=ios&__channel=appstore";
    [HMHttpTool get:imageScUrl parameters:nil success:^(id json) {
        //首页图片
        for (NSArray *array in json[@"data"]) {
            KKImages *imageModel = [KKImages mj_objectWithKeyValues:array];
            [self.headNewsArray addObject:imageModel];
        }
        [self getCollectViewData];
        
    } failure:^(NSError *error) {
        
        NSLogg(@"first Hello 女神 error--%@",error);
    }];
    
    
}

//CollectViewData
- (void)getCollectViewData{
    
    
    //首页
    NSString *hotUrl = @"http://api.m.panda.tv/ajax_get_live_list_by_multicate?pagenum=4&hotroom=1&__version=1.0.14.1190&__plat=ios&__channel=appstore";
    
    [HMHttpTool get:hotUrl parameters:nil success:^(id json) {
        
        //1.reloadData
        [self.insideHots removeAllObjects];
        
        for (NSArray *array in json[@"data"]) {
            KKHots *hots = [KKHots mj_objectWithKeyValues:array];
            [self.insideHots addObject:hots];
        }
        
        
        if (self.isAddBgVV == YES) {
            self.bgVV.alpha = 0;
            [self.bgVV removeFromSuperview];
        }
        
        
        //2.reloadData Set方法
        self.newsArray = self.headNewsArray;
        self.hots = self.insideHots;
        
        //3.停止刷新
        if (self.collectView.mj_header.isRefreshing) {
            [self.collectView.mj_header endRefreshing];
        }
        

        
    } failure:^(NSError *error) {
        
        //停止刷新
        if (self.isAddBgVV == YES) {
            self.bgVV.alpha = 0;
            [self.bgVV removeFromSuperview];
        }
        
        if (self.collectView.mj_header.isRefreshing) {
            [self.collectView.mj_header endRefreshing];
        }
        
//        if (self.collectView.mj_footer.isRefreshing) {
//            [self.collectView.mj_footer endRefreshing];
//        }
        
        
        
        [SVProgressHUD setMinimumDismissTimeInterval:1.0];
        [SVProgressHUD showInfoWithStatus:@"加载失败，请检查网络!"];
        
        NSLogg(@"first Hello 女神 error--%@",error);
    }];
    
    
}


#pragma mark - 刷新方法
- (void)refreshHeader{
    
    [self getFirstScPic];
    
}
//- (void)refreshFooter{
//    
//    [self getFirstScPic];
//    
//}




#pragma mark - Set方法，可以首页传数据进来，现在改成自己刷新
- (void)setHots:(NSMutableArray *)hots{
    
    _hots = hots;
    
    [self.collectView reloadData];
}

- (void)setNavgationCC:(UINavigationController *)navgationCC{
    _navgationCC = navgationCC;
    self.headerView.navgationCC = self.navgationCC;
    
}

//头部滚动数据
- (void)setNewsArray:(NSMutableArray *)newsArray{
    
    _newsArray = newsArray;
    
    //提取 Image URL
    NSMutableArray *picArray = [NSMutableArray array];
    if (newsArray.count >= 1) {
        
        KKFirstPage *firstpage = newsArray[0];
        [picArray addObject:firstpage.bigimg];
        
        [newsArray removeObjectAtIndex:0];
        
        for (KKImages *imageM in newsArray) {
            [picArray addObject:imageM.bigimg];
        }
        
    }
    
    
    if (picArray.count > 0) {
        [self.headImageScView setImageScrollerWithImages:picArray];
    }
    
    
}

@end
