//
//  KKMeViewController.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/22.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKMeViewController.h"
#import "RETableViewManager.h"
#import "KKAboutViewController.h"



#define SectionHeaderHeight 4
#define SectionFooterHeight 3



@interface KKMeViewController ()<RETableViewManagerDelegate>

@property (nonatomic,strong)UITableView *tableMainView;
@property (nonatomic, strong) RETableViewManager *manager;

@end

@implementation KKMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableMainView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    //self.tableMainView.delegate = self;
   // self.tableMainView.dataSource = self;
    self.tableMainView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableMainView];
    self.tableMainView.backgroundColor = HMColor(235, 235, 235, 1);
    
    self.navigationItem.title = @"我的";
    
    [self.tableMainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    
    // 创建RETableViewManager管理类
    self.manager = [[RETableViewManager alloc]initWithTableView:self.tableMainView delegate:self];
    self.manager.style.cellHeight = 45;
   
    // 选中不显示高亮
    //self.manager.style.defaultCellSelectionStyle = UITableViewCellSelectionStyleNone;
    
    //Login
    [self addSectionLogin];
    //MyLove
    [self addSectionMyLove];
    //History
    [self addSectionHistory];
    //Money
    [self addSectionMoney];
   
    
    // 添加检查更新
    [self addSectionUpdate];
    
    // 添加系统设置组
    [self addSectionSetting]; 
   
    // 添加关于
    [self addSectionAbout];
    
}

#pragma mark addSectionLogin
- (void)addSectionLogin
{
    // 创建一个组
    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
    section.headerHeight = SectionHeaderHeight * 3;
    section.footerHeight = SectionFooterHeight;
   
    //__typeof (self) __weak selfVc = self;
    // 创建组中的条目
    RETableViewItem *item = [RETableViewItem itemWithTitle:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        
        
    }];
    
    item.cellHeight = 65;
    item.style = UITableViewCellStyleValue1;
    item.selectionStyle = UITableViewCellSelectionStyleNone;
    item.detailLabelText = @"点击登陆";
    item.textAlignment = NSTextAlignmentRight;
    item.image = [UIImage imageNamed:@"head_img_press"];
    [section addItem:item];
    
}
#pragma mark addSectionMyLove
- (void)addSectionMyLove
{
    // 创建一个组
    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
    section.headerHeight = SectionHeaderHeight * 2;
    section.footerHeight = SectionFooterHeight;
    
    __typeof (self) __weak selfVc = self;
    // 创建组中的条目
    RETableViewItem *item = [RETableViewItem itemWithTitle:@"我的关注" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        
        
    }];
    
   // item.cellHeight = 65;
    item.style = UITableViewCellStyleValue1;
    item.selectionStyle = UITableViewCellSelectionStyleNone;
   // item.detailLabelText = @"点击登陆";
    item.textAlignment = NSTextAlignmentRight;
    item.image = [UIImage imageNamed:@"my_attention"];
    [section addItem:item];
    
}
#pragma mark addSectionHistory
- (void)addSectionHistory
{
    // 创建一个组
    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
    section.headerHeight = SectionHeaderHeight * 2;
    section.footerHeight = SectionFooterHeight;
    
    __typeof (self) __weak selfVc = self;
    // 创建组中的条目
    RETableViewItem *item = [RETableViewItem itemWithTitle:@"观看历史" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        
        
    }];
    
   // item.cellHeight = 65;
    item.style = UITableViewCellStyleValue1;
    item.selectionStyle = UITableViewCellSelectionStyleNone;
   // item.detailLabelText = @"点击登陆";
    item.textAlignment = NSTextAlignmentRight;
    item.image = [UIImage imageNamed:@"history"];
    [section addItem:item];
    
}
#pragma markaddSectionMoney
- (void)addSectionMoney
{
    // 创建一个组
    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
    section.headerHeight = SectionHeaderHeight * 2;
    section.footerHeight = SectionFooterHeight;
    
    __typeof (self) __weak selfVc = self;
    // 创建组中的条目
    RETableViewItem *item = [RETableViewItem itemWithTitle:@"猫币充值" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        
        
    }];
    
    //item.cellHeight = 65;
    item.style = UITableViewCellStyleValue1;
    item.selectionStyle = UITableViewCellSelectionStyleNone;
   // item.detailLabelText = @"点击登陆";
    item.textAlignment = NSTextAlignmentRight;
    item.image = [UIImage imageNamed:@"charge_maobi_icon"];
    [section addItem:item];
    
}



#pragma mark 添加检查更新
- (void)addSectionUpdate
{
    // 创建一个组
    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
   // section.footerTitle = @"检查更新";
    section.headerHeight = SectionHeaderHeight * 2;
    section.footerHeight = SectionFooterHeight;
    
    __typeof (self) __weak selfVc = self;
    // 创建组中的条目
    RETableViewItem *item = [RETableViewItem itemWithTitle:@"检查更新" accessoryType:UITableViewCellAccessoryNone selectionHandler:^(RETableViewItem *item) {
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:selfVc.view animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.labelText = @"检查更新中...";
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            // Do something...
            hud.mode = MBProgressHUDModeText;
            hud.labelText = @"没有更新！";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
                // Do something...
                [MBProgressHUD hideHUDForView:selfVc.view animated:YES];
            });
        
        });
    }];
    
    item.selectionStyle = UITableViewCellSelectionStyleNone;
    item.image = [UIImage imageNamed:@"plugin_icon_offline"];
    [section addItem:item];
    
}





#pragma mark 添加系统设置组
- (void)addSectionSetting
{
    // 创建一个组
    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
    section.headerHeight = SectionHeaderHeight * 2;
    section.footerHeight = SectionFooterHeight;
   // section.headerTitle = @"系统设置";
    
    __typeof (self) __weak selfVc = self;
    
    // 活动中心
    RETableViewItem *activity = [RETableViewItem itemWithTitle:@"活动中心" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        
        
    }];
    activity.selectionStyle = UITableViewCellSelectionStyleNone;
    activity.image = [UIImage imageNamed:@"icon_huodong"];
    [section addItem:activity];
    
    
    // 开播提醒
    REBoolItem *notifi = [REBoolItem itemWithTitle:@"开播提醒" value:NO switchValueChangeHandler:^(REBoolItem *item) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        if (item.value) {
            [defaults setBool:YES forKey:@"isAllowedNotifi"];
            
        }else{
            [defaults setBool:NO forKey:@"isAllowedNotifi"];
        }
        
        
    }];
    
    notifi.image = [UIImage imageNamed:@"bamboo_task_available"];
    [section addItem:notifi];
    
    
    // 清除缓存
    RETableViewItem *cleanItem = [RETableViewItem itemWithTitle:@"清除缓存" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        // 显示清除缓存中
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:selfVc.view animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.labelText = @"清除缓存中...";
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            // 清除缓存
            NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            
            NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
            NSUInteger fileCount = [files count];
            //NSLog(@"files :%ld",[files count]);
            for (NSString *p in files) {
                NSError *error;
                NSString *path = [cachPath stringByAppendingPathComponent:p];
                if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                    [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                }
            }
            
            hud.mode = MBProgressHUDModeText;
            hud.labelText = [NSString stringWithFormat:@"清除缓存文件%ld个!",fileCount];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
                // Do something...
                [MBProgressHUD hideHUDForView:selfVc.view animated:YES];
            });
            
        });
    }];
    cleanItem.selectionStyle = UITableViewCellSelectionStyleNone;
    cleanItem.image = [UIImage imageNamed:@"clean"];
    [section addItem:cleanItem];
    
    
    
    
    //意见反馈
    RETableViewItem *feed_back = [RETableViewItem itemWithTitle:@"意见反馈" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
        
        
    }];
    feed_back.selectionStyle = UITableViewCellSelectionStyleNone;
    feed_back.image = [UIImage imageNamed:@"feed_back"];
    [section addItem:feed_back];
    
    
    
}



#pragma mark 添加关于
- (void)addSectionAbout
{
    // 创建一个组
    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
    section.headerHeight = SectionHeaderHeight * 2;
    section.footerHeight = SectionFooterHeight;
   // section.headerTitle = @"关于我们";
    
    __typeof (self) __weak weakSelf = self;
    // 创建组中的条目 打分
    RETableViewItem *AboutItem = [RETableViewItem itemWithTitle:@"关于我们" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        KKAboutViewController *aboutCtr = [[KKAboutViewController alloc]init];
        aboutCtr.title = @"关于";
        [weakSelf.navigationController pushViewController:aboutCtr animated:YES];
    }];
    AboutItem.selectionStyle = UITableViewCellSelectionStyleNone;
    AboutItem.image = [UIImage imageNamed:@"about2"];
    [section addItem:AboutItem];
}

- (void) alertWithTitle: (NSString *)_title_ msg: (NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:_title_
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}





//
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    
//    return 7;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//    if (section == 5) {
//        return 4;
//    }else{
//        return 1;
//    }
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    //1.创建cell
//    static NSString *ID = @"setting";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    
//    if (cell == nil) {
//        
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.textLabel.text = [NSString stringWithFormat:@"----第%ld行----",indexPath.row];
//    return cell;
//}
//
//
//
//
//
//
////- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
////    
////    return 10;
////}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    
//    if (section == 0) {
//        return 10;
//    }else{
//        return 5;
//    }
//    
//    
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    
//    if (section == 6) {
//        return 10;
//    }else{
//        return 5;
//    }
//    
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
//    
//    if (indexPath.section == 0) {
//        return 65;
//    }else{
//        return 45;
//    }
//}
//





@end
