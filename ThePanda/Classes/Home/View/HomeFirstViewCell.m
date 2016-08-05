//
//  HomeFirstViewCell.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "HomeFirstViewCell.h"
#import "KKHomeTableViewCell.h"
#import "HomeFirstHeaderV.h"
@interface HomeFirstViewCell()<KKImageScrollerDelegate>
@property (nonatomic,strong)NSMutableArray *subTopicsArray;
@end


@implementation HomeFirstViewCell


- (NSMutableArray *)subTopicsArray{
    if (_subTopicsArray == nil) {
        self.subTopicsArray = [NSMutableArray array];
    }
    return _subTopicsArray;
}




- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        
      
        self.backgroundColor = [UIColor whiteColor];
//        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, HMScreenW, 250) style:UITableViewStyleGrouped];
//        _tableView.dataSource = self;
//        _tableView.delegate = self;
//        _tableView.showsVerticalScrollIndicator = YES;
//        
//        _tableView.rowHeight = 250;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        
//        [self addSubview:_tableView];
//        
//
//        
//        
//        _headImageScView = [[KKImageScroller alloc] init];
//        _headImageScView.delegate = self;
//        _headImageScView.frame = CGRectMake(0, 0, HMScreenW, 210);
//#pragma mark - 先设置大小 再设置为 tableHeaderView
//    //[_tableView setTableHeaderView:_headImageScView];
//        _tableView.tableHeaderView = _headImageScView;
//        
        


        _waterFlowView = [[KKWaterFlowView alloc] init];
        _waterFlowView.frame = CGRectMake(0, 0, HMScreenW, self.height);
      
        [self addSubview:_waterFlowView];
        
        
        
    }
    return self;
}

//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return self.hots.count;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    KKHots *hot = self.hots[section];
////    return hot.items.count / 2 + 1;
//    return hot.items.count;
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    //取模型赋值
//   KKHots *hot = self.hots[indexPath.section];
//    KKItems *item = hot.items[indexPath.row];
//    
//    //1.创建cell
//    static NSString *ID = @"topicCellID";
//    KKHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"KKHomeTableViewCell" owner:nil options:nil] lastObject];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        
//    }
//    
//    //    NSLogg(@"reloadData-%ld-%ld",indexPath.section,indexPath.row);
//    cell.item = item;
//    return cell;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0.1;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    
//    return 30;
//}
//
//
//
//
//
////- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
////    return 210;
////}
////
////- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
////    
////    return 210;
////}
//
////- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
////    
////    return @"热门推荐";
////}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    HomeFirstHeaderV *headerView = [HomeFirstHeaderV shareHomeFirstHeaderV:tableView];
//    KKHots *hot = self.hots[section];
//    headerView.sectionTitle = hot.type.cname;
//    headerView.contentView.backgroundColor = [UIColor whiteColor];
//    headerView.frame = CGRectMake(0, 5, HMScreenW, 20);
//    //    UIView *headerView = [[UIView alloc] init];
//    //    headerView.backgroundColor = [UIColor redColor];
//    
//    return  headerView;
//
//}
//
//

//- (void)setNewsArray:(NSMutableArray *)newsArray{
//    
//    _newsArray = newsArray;
//    
//    //提取 Image URL
//    NSMutableArray *picArray = [NSMutableArray array];
//    if (newsArray.count >= 1) {
//        
//        KKFirstPage *firstpage = newsArray[0];
//        [picArray addObject:firstpage.bigimg];
//        
//        [newsArray removeObjectAtIndex:0];
//        
//        for (KKImages *imageM in newsArray) {
//            [picArray addObject:imageM.bigimg];
//        }
//        
//    }
//    
//    
//    if (picArray.count > 0) {
//        [self.headImageScView setImageScrollerWithImages:picArray];
//    }
//    
//    
//}


- (void)setHots:(NSMutableArray *)hots{
    
    _hots = hots;
    
   // [self.tableView reloadData];
    self.waterFlowView.hots = hots;
    
}

- (void)setNavgationCC:(UINavigationController *)navgationCC{
    _navgationCC = navgationCC;
    _waterFlowView.navgationCC = self.navgationCC;
    
}


@end
