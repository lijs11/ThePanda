////
////  RootViewController.m
////  仿熊猫TV
////
////  Created by kehwa on 16/4/21.
////  Copyright © 2016年 kehwa. All rights reserved.
////
//
//#import "RootViewController.h"
//#import "NavigationViewController.h"
//#import "HomeViewController.h"
//#import "ChannelViewController.h"
//#import "LiveViewController.h"
//#import "UserViewController.h"
//
//@interface RootViewController ()<UINavigationControllerDelegate,UITabBarDelegate>
//
//@property (nonatomic , strong)Tabbar *tabbar;
//
//@end
//
//@implementation RootViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    HomeViewController *homeVC = [[HomeViewController alloc]init];
//    NavigationViewController *homeNav = [[NavigationViewController alloc]initWithRootViewController:homeVC];
//    homeNav.delegate = self;
//    homeVC.navigationItem.title = @"广场";
//    [self addChildViewController:homeNav];
//    
//    ChannelViewController *channelVC = [[ChannelViewController alloc]init];
//    NavigationViewController *channelNav = [[NavigationViewController alloc]initWithRootViewController:channelVC];
//    channelNav.delegate = self;
//    channelVC.navigationItem.title = @"栏目";
//    [self addChildViewController:channelNav];
//    
//    
//    LiveViewController *liveVC = [[LiveViewController alloc]init];
//    NavigationViewController *liveNav = [[NavigationViewController alloc]initWithRootViewController:liveVC];
//    liveNav.delegate = self;
//    liveVC.navigationItem.title = @"直播";
//    [self addChildViewController:liveNav];
//    
//    UserViewController *userVC = [[UserViewController alloc]init];
//    NavigationViewController *userNav = [[NavigationViewController alloc]initWithRootViewController:userVC];
//    userNav.tabBarItem.title = @"我的";
//    [self addChildViewController:userNav];
//    
//    
//    self.tabbar = [[Tabbar alloc]init];
//    self.tabbar.delegate = self;
//    self.tabbar.frame = CGRectMake(0, self.view.frame.size.height - 49, self.view.frame.size.width, 49);
//    [self.view addSubview:self.tabbar];
//    
//    [self.tabbar addItemwithIcon:@"home.png" selectedIcon:@"home_pressed.png" title:@"首页"];
//    [self.tabbar addItemwithIcon:@"column.png" selectedIcon:@"column_pressed.png" title:@"栏目"];
//    [self.tabbar addItemwithIcon:@"live.png" selectedIcon:@"live_pressed.png" title:@"直播"];
//    [self.tabbar addItemwithIcon:@"user.png" selectedIcon:@"user_select.png" title:@"我的"];
//    
//}
//
//#pragma mark -- 实现页面TabBar页面转换的代理方法
//-(void)tabbar:(Tabbar *)tabbar itemSelectedFrom:(int)from to:(int)to
//{
//    if (to < 0 || to > self.childViewControllers.count) {
//        return;
//    }
//    
//    //取得旧的控制器的view
//    UIViewController *oldController = [self.childViewControllers objectAtIndex:from];
//    [oldController.view removeFromSuperview];
//    
//    //取得将要显示的控制器的view
//    UIViewController *newController = [self.childViewControllers objectAtIndex:to];
//    //设置将要显示的控制器的的view大小
//    float width = self.view.frame.size.width;
//    float height = self.view.frame.size.height - 49;
//    newController.view.frame = CGRectMake(0, 0, width, height);
//    //添加要显示的控制器的view
//    [self.view addSubview:newController.view];
//}
//
//
//#pragma mark --UINavigationDeleagte
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    
//    //获取当前导航控制器的根控制器
//    UINavigationController *rootController = [navigationController.viewControllers objectAtIndex:0 ];
//    if (rootController != viewController) {  //将要显示的控制器不是根控制器
//        //设置导航控制器的高度，使下方的dock消失，并使导航控制器的高度变大
//        CGRect frame = navigationController.view.frame;
//        //frame.size.height = kScreenHeight;
//        frame.size.height = [UIScreen mainScreen].bounds.size.height;
//        navigationController.view.frame = frame;
//        
//        
//        //添加dock到根控制器的view上，便于跳转时使dock跟随移动
//        [self.tabbar removeFromSuperview];
//        CGRect tabbarFrame = self.tabbar.frame;
//        tabbarFrame.origin.y = rootController.view.frame.size.height - self.tabbar.frame.size.height;
//        if ([rootController.view isKindOfClass:[UIScrollView class]]) {
//            UIScrollView *scroll = (UIScrollView *)rootController.view;
//            [scroll addSubview:self.tabbar];
//            [UIView beginAnimations:nil context:nil];
//            tabbarFrame.origin.y += scroll.contentOffset.y;
//            [UIView commitAnimations];
//            
//        }
//        self.tabbar.frame = tabbarFrame;
//        [rootController.view addSubview:self.tabbar];
//    }
//}
//
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    //开启手势
//    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        navigationController.interactivePopGestureRecognizer.enabled = YES;
//    }
//    
//    //获得当前导航控制器的根控制器
//    UINavigationController *rootController = [navigationController.viewControllers objectAtIndex:0];
//    if (rootController == viewController) {
//        //将要显示的视图控制器是根视图控制器，此时tabbar出现，并加在self.view上
//        //还原导航控制器视图的高度
//        CGRect frame = navigationController.view.frame;
//        frame.size.height = [UIScreen mainScreen].bounds.size.height;
//        //frame.size.height = [UIScreen mainScreen].applicationFrame.size.height;
//        navigationController.view.frame = frame;
//        
//        //添加tabbar到mainView上
//        [self.tabbar removeFromSuperview];
//        CGRect tabbarFrame = self.tabbar.frame;
//        //调整tabbar的高度
//        tabbarFrame.origin.y = self.view.frame.size.height - self.tabbar.frame.size.height;
//        self.tabbar.frame = tabbarFrame;
//        [self.view addSubview:self.tabbar];
//    }
//    
//}
//
//@end
