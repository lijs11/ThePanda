//
//  KKHomeViewController.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/22.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKHomeViewController.h"
#import "KKImageScroller.h"
#import "KKTitleScrollView.h"

#import "HomeCollectionCell.h"
#import "HomeFirstViewCell.h"

#import "KKGetDataTool.h"
#import "KKHomeTitleScParam.h"
#import "KKHomeTitleResult.h"
#import "KKTitles.h"


#import "KKSavingTool.h"

#import "KKFirstPage.h"
#import "KKImages.h"
#import "KKHots.h"
#import "KKItems.h"
#import "KKUserinfo.h"
#import "KKTypes.h"
/** 高度  */
static const CGFloat KKTitleVewHeight = 45;
static const CGFloat KKNavigationBarHeight = 64;
static const CGFloat KKTabbarHeight = 49;


@interface KKHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,KKTitleScrollViewDelegate,KKImageScrollerDelegate>

@property (nonatomic,strong)UIView *contentMainView;


/**图片轮播器,数据*/
@property (nonatomic,strong)NSMutableArray *newsesArray;



/**TitleView*/
/**中文的titleName*/
@property (nonatomic,strong)NSMutableArray *titlesArray;
/**英文的titleName*/
@property (nonatomic,strong)NSMutableArray *titleenNamesArray;

@property (nonatomic,strong)KKTitleScrollView *titleScView;


/**CollectionView相关*/
@property (nonatomic,strong)NSMutableArray *topicsArray;
@property (nonatomic,strong)UICollectionView *collectView;

//选中的是哪个Item，每次记录点击便于TableView topic选择
@property (nonatomic, assign) NSInteger selectedItem;


/**Hots*/
@property (nonatomic,strong)NSMutableArray *hots;

//@property (nonatomic,strong)UIView *bgVV;
//@property (nonatomic,assign) BOOL isAddBgVV;
@end

@implementation KKHomeViewController

#pragma mark - lazyLoading
//
- (NSMutableArray *)newsesArray{
    if (_newsesArray == nil) {
        self.newsesArray = [NSMutableArray array];
    }
    return _newsesArray;
}


//
- (NSMutableArray *)titlesArray{
    if (_titlesArray == nil) {
        self.titlesArray = [NSMutableArray array];
    }
    return _titlesArray;
}

//
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
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        //        layout.itemSize = CGSizeMake(self.view.width,self.topicsArray.count * 250);
        //        layout.itemSize = CGSizeMake(self.view.width, 5 * 250);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        //        layout.headerReferenceSize = CGSizeZero;
        //        layout.footerReferenceSize = CGSizeZero;
        
        self.collectView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        self.collectView.pagingEnabled = YES;
        self.collectView.backgroundColor = [UIColor whiteColor];
        self.collectView.delegate = self;
        self.collectView.dataSource = self;
        self.collectView.showsHorizontalScrollIndicator = NO;
        self.collectView.bounces = NO;//默认YES 不带弹簧效果
        
        //        [self.collectView registerNib:[UINib nibWithNibName:@"KKHomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"KKHomeCollectionViewCellID"];
        [self.collectView registerClass:[HomeCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeCollectionCell class])];
        [self.collectView registerClass:[HomeFirstViewCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeFirstViewCell class])];
        
       
        
        
    }
    
    return _collectView;
}


//- (UIView *)bgVV{
//    
//    if (_bgVV == nil) {
//        UIView *bgVV = [[UIView alloc] initWithFrame:CGRectMake(HMScreenW / 2 - 50, HMScreenH / 3 , 100, 140)];
//        bgVV.backgroundColor = [UIColor whiteColor];
//        bgVV.alpha = 1;
//        [self.view addSubview:bgVV];
//        self.bgVV = bgVV;
//        
//        UIImageView *imageV = [[UIImageView alloc] init];
//        imageV.frame = CGRectMake(0, 0, 100, 110);
//        imageV.image = [UIImage imageNamed:@"panda1"];
//        [bgVV addSubview:imageV];
//        
//        UILabel *label = [[UILabel alloc] init];
//        label.frame = CGRectMake(0, 120, 100, 20);
//        label.text = @"正在努力加载中...";
//        label.font = [UIFont systemFontOfSize:10];
//        label.textAlignment = NSTextAlignmentCenter;
//        [bgVV addSubview:label];
//    }
//    return _bgVV;
//}


#pragma mark - init

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNav];
    [self setupMainViews];
    [self layoutUI];
    [self getData];
    
}

- (void)setNav{
    
    //标题ImageV
    UIImageView *navTitileView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_logo"]];
    navTitileView.size = navTitileView.image.size;
    self.navigationItem.titleView =navTitileView;
    
    //左
    UIImage *navLeftImage = [UIImage imageNamed:@"channel_manage_icon"];
    navLeftImage = [navLeftImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:navLeftImage style:UIBarButtonItemStyleDone target:self action:@selector(leftItemClicked)];
    leftItem.imageInsets = UIEdgeInsetsMake(3, 0, -3, 0);
    self.navigationItem.leftBarButtonItem = leftItem;
    
    //右
    UIImage *navRightImage = [UIImage imageNamed:@"search"];
    navRightImage = [navRightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:navRightImage style:UIBarButtonItemStyleDone target:self action:@selector(rightItemClicked)];
    rightItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    
}

//left Btn Click
- (void)leftItemClicked{
    
    
    
}
//right Btn Click
- (void)rightItemClicked{
    
    
    
}

- (void)setupMainViews{
    
    
    //contentMainView
    self.contentMainView = [[UIView alloc] init];
    self.contentMainView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.contentMainView];
    
    
    //titleScView
    NSMutableArray *titleMuArray = [NSMutableArray array];
    [titleMuArray addObject:[NSString stringWithFormat:@"精彩推荐"]];
 
    if (self.titlesArray.count > 0) {
        for (KKTitles *title in self.titlesArray) {
            [titleMuArray addObject:title.cname];
        }
    }
    
    
    self.titleScView = [[KKTitleScrollView alloc] initWithTitleArray:titleMuArray titleSubWidth:85];
    self.titleScView.backgroundColor = [UIColor redColor];
    self.titleScView.delegate = self;
    
    [self.contentMainView addSubview:self.titleScView];
    [self.contentMainView addSubview:self.collectView];
    
    
  
    
}

- (void)layoutUI{
    
    [self.contentMainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(64);
        make.leading.trailing.bottom.equalTo(self.view);
    }];
    
    [self.titleScView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentMainView);
        make.leading.mas_equalTo(self.contentMainView);
        make.trailing.mas_equalTo(self.contentMainView);
        make.height.mas_equalTo(45);
    }];
    
    
  
    
    [self.collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleScView.mas_bottom);
        make.leading.trailing.equalTo(self.contentMainView);
        make.height.mas_equalTo(HMScreenH - KKNavigationBarHeight - KKTabbarHeight - KKTitleVewHeight);
    }];
    
 
    
    
}

#pragma mark - titleData 首页只需要这个Data，其他每个子控件自己刷新
- (void)getData{
    
//#pragma mark - 写成一个Lib
        //titleSc
    [KKGetDataTool homeTitleDataWithParam:nil success:^(KKHomeTitleResult *result) {
        
        [self.titlesArray removeAllObjects];
        self.titlesArray = [NSMutableArray arrayWithArray:result.data];
        
        [self reloadTitleScData];//刷新titleSc
        [self.collectView reloadData];//刷新collectionView
        
    } failure:^(NSError *error) {
        
        [MBProgressHUD showError:@"获取数据错误,请检查网络!"];
        NSLogg(@"titleSc error--%@",error);
    }];
    
    
}





#pragma mark - titleScDelegate
- (void)titleScrollViewDidClicked:(KKTitleScrollView *)titleScrollView atIndex:(NSInteger)index{
    
    NSLogg(@"点击标签--%ld",(long)index);
    self.selectedItem = index;
    //滚到对应的Item
    CGPoint position = CGPointMake(index * self.view.width, 0);
    [self.collectView setContentOffset:position animated:YES];
    
}

#pragma mark - titleSc更新
- (void)reloadTitleScData{
    
    //titleScView
    NSMutableArray *titleMuArray = [NSMutableArray array];
    [titleMuArray addObject:[NSString stringWithFormat:@"精彩推荐"]];
    for (KKTitles *title in self.titlesArray) {
        // NSLogg(@"%@",title.cname);
        [titleMuArray addObject:title.cname];
    }
    
    [self.titleScView updateSubViewsWithTitleArray:titleMuArray titleSubWidth:85];
    
    
    
    //当前title标题 more + enameS
    NSMutableArray *titleenNamesArray = [NSMutableArray array];
    self.titleenNamesArray = titleenNamesArray;
    [titleenNamesArray addObject:[NSString stringWithFormat:@"more"]];
    for (KKTitles *title in self.titlesArray) {
        [titleenNamesArray addObject:title.ename];
    }
    
    

}




#pragma mark - UICollectionView--Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titlesArray.count + 1;//多了精彩推荐
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
//    cell.tableView.delegate = self;
//    cell.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (indexPath.section == 0 && indexPath.item == 0 ) {//第一个不一样,上部分是ImageSc 下部分是tableview
        //        NSLogg(@"indexPath--%@,item--%ld",indexPath,(long)indexPath.item);
       // cell.topics = self.topicsArray;
    HomeFirstViewCell *firstCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeFirstViewCell class]) forIndexPath:indexPath];
        firstCell.navgationCC = self.navigationController;
        //firstCell.waterFlowView.newsArray = self.newsesArray;
        //firstCell.waterFlowView.hots = self.hots;
        return firstCell;
        
    }else{
        
        HomeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeCollectionCell class]) forIndexPath:indexPath];

       
        cell.selectedItem = indexPath.item;
        cell.titleenName = self.titleenNamesArray[indexPath.item];
        
        
        cell.navgationCC = self.navigationController;
        
        
         NSLogg(@"selectedItem %ld - indexPath.item %ld",self.selectedItem,indexPath.item);
        return cell;
    }

    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectView.bounds.size;
}





//CollectionView滚到一个Item，计算contentOffset.x所在index-->传给TitileView
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
        
        NSInteger indexOfSc = scrollView.contentOffset.x / self.view.width;
        self.selectedItem = indexOfSc;//记录
        //        NSLogg(@"CollectionView IndexPath--%ld",(long)indexOfSc);
        [self.titleScView selectItemAtIndex:indexOfSc];
    }
}









@end
