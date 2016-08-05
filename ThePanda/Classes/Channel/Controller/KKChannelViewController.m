//
//  KKChannelViewController.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/22.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKChannelViewController.h"
#import "KKWaterFlowCell.h"
#import "KKHeaderReusableView.h"
#import "KKWebViewController.h"

#import "KKTitles.h"
#import "KKFirstPage.h"
#import "KKImages.h"
#import "SVProgressHUD.h"

#import "KKChannelCell.h"
#import "KKSubChannelViewController.h"

@interface KKChannelViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
//英文Name
@property (nonatomic,copy) NSString *titleenName;
@property (nonatomic,assign) NSInteger selectedItem;

/**英文的titleNameS*/
@property (nonatomic,strong)NSMutableArray *titleenNamesArray;


@property (nonatomic,strong)UICollectionView *collectView;
/**Flow分类*/
@property (nonatomic,strong)NSMutableArray *hots;

/**首页分类*/
@property (nonatomic,strong)NSMutableArray *titles;

@end

@implementation KKChannelViewController

- (NSMutableArray *)hots{
    
    if (_hots == nil) {
        self.hots = [NSMutableArray array];
    }
    return _hots;
}


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




/*UIcollectionView 懒加载**/
- (UICollectionView *)collectView{
    if (_collectView == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
        CGFloat itemW = HMScreenW / 3 - 7;
        CGFloat itemH = itemW * 193 / 116;
        layout.itemSize = CGSizeMake(itemW,itemH);
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
    //    [self.collectView registerNib:[UINib nibWithNibName:@"KKChannelCell" bundle:nil] forCellWithReuseIdentifier:@"KKChannelCellID"];
        
        
        UINib *nib = [UINib nibWithNibName:@"KKChannelCell" bundle: [NSBundle mainBundle]];
        [self.collectView registerNib:nib forCellWithReuseIdentifier:@"KKChannelCellReus"];
        
        //注册Header
        [self.collectView registerClass:[KKHeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        
    }
    
    return _collectView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_logo"]];
    
    
    
    //1.collectView
    [self.view addSubview:self.collectView];
    
    [self.collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(5);
        make.leading.trailing.bottom.equalTo(self.view);
        
    }];
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.collectView.mj_header = header;
    
    
    [self getData];
    
    
}

- (void)refreshHeader{
    
     [self getData];
    
}


#pragma mark - UICollectionView--Delegate

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//
//    return self.hots.count;
//
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (self.titles.count == 0) {
        return 0;
    }else{
       
        return self.titles.count;
    }
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    KKChannelCell *cell =(KKChannelCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"KKChannelCellReus" forIndexPath:indexPath];
  
    KKTitles *title = self.titles[indexPath.item];
    if (title){
    cell.title = title;
    }
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return self.collectView.bounds.size;
//}

- (void)getData{
    
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        
        NSString *url = @"http://api.m.panda.tv/ajax_get_all_subcate?__version=1.0.14.1190&__plat=ios&__channel=appstore";
        
        
        
        [HMHttpTool post:url parameters:nil success:^(id json) {
            
            //1.值
            [self.titles removeAllObjects];
            for (NSArray *array in json[@"data"]) {
                KKTitles *title = [KKTitles mj_objectWithKeyValues:array];
                [self.titles addObject:title];
            }
            
            if (self.titles.count == 0) {
                [SVProgressHUD setMinimumDismissTimeInterval:1.0];
                [SVProgressHUD showInfoWithStatus:@"加载失败，请检查网络!"];
                
            }
            
            //2.设置Data
            [self.collectView reloadData];
            
            if ( [self.collectView.mj_header isRefreshing]) {
                [self.collectView.mj_header endRefreshing];
            }
            
            
            
            //3.取出所有英文名，便于subV加载数据
            [self.titleenNamesArray removeAllObjects];
           
            for (KKTitles *title in self.titles) {
                [self.titleenNamesArray addObject:title.ename];
            }
            
            
        } failure:^(NSError *error) {
            
            if ( [self.collectView.mj_header isRefreshing]) {
                [self.collectView.mj_header endRefreshing];
            }
            
            NSLogg(@"getData--error %@",error);
            
        }];
    });
    
}





#pragma mark - didSelectItem
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    KKSubChannelViewController *subVc = [[KKSubChannelViewController alloc] init];    
    [self.navigationController pushViewController:subVc animated:YES];
    if (indexPath.item == 0) {
        subVc.selectedItem = 100;// = 0时 KKNewFlowView为了首页屏蔽了，其实可以加一个判断是不是主页第一页、
    }else{
        subVc.selectedItem = indexPath.item;
    }
    
    subVc.titleenName = self.titleenNamesArray[indexPath.item];
    
    KKTitles *title = self.titles[indexPath.item];
    subVc.titlecnName = title.cname;
    
}







@end
