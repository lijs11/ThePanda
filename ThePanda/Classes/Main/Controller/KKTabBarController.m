//
//  KKTabBarController.m
//  banTangSuger
//
//  Created by Kenny.li on 16/5/28.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKTabBarController.h"

#import "KKHomeViewController.h"
#import "KKChannelViewController.h"
#import "KKLiveViewController.h"
#import "KKMeViewController.h"

#import "KKNavigationController.h"
#import "KKCoverView.h"

@interface KKTabBarController ()<UITabBarControllerDelegate>
@property (nonatomic,assign) BOOL isAddedCenterBtn;
@property (nonatomic,strong)KKCoverView *coverView;
@end

@implementation KKTabBarController


- (void)viewDidLoad{
    
    self.isAddedCenterBtn = NO;
    self.delegate = self;
    
    UITabBar *tabbar = [UITabBar appearance];
    tabbar.backgroundColor = [UIColor whiteColor];
    tabbar.translucent = NO;
    
    [self setupItemWithVc];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       // [self setupCoverView];
    });
}


#pragma mark - 设置Item
- (void)setupItemWithVc{
    
    [self addChildViewController:[[KKHomeViewController alloc] init] withImageName:@"home" selectedImageName:@"home_pressed" title:@"主页" tag:0];
    [self addChildViewController:[[KKChannelViewController alloc] init] withImageName:@"column" selectedImageName:@"column_pressed" title:@"栏目" tag:1];
    [self addChildViewController:[[KKLiveViewController alloc] init] withImageName:@"live" selectedImageName:@"live_pressed" title:@"直播" tag:2];
    [self addChildViewController:[[KKMeViewController alloc] init] withImageName:@"user" selectedImageName:@"user_pressed" title:@"我的" tag:3];
    
    
}

- (void)addChildViewController:(UIViewController *)childController withImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName title:(NSString *)title tag:(NSInteger)tag{
    
    UITabBarItem *item = [[UITabBarItem alloc] init];
    
    if (imageName) {
        UIImage *image = [UIImage imageNamed:imageName];
        item.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    if (selectedImageName) {
        UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
        item.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
   // item.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
    
    item.title = title;
    item.tag = tag;
    
    childController.tabBarItem = item;
    
    if (tag != 3) {
        KKNavigationController *nav = [[KKNavigationController alloc] initWithRootViewController:childController];
        [self addChildViewController:nav];
    }else{
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childController];
        [self addChildViewController:nav];
    }
   
    
    
    
}

//添加遮盖--新鲜事儿
- (void)setupCoverView{
    
    KKCoverView *coverView = [[KKCoverView alloc] init];
    coverView.frame = self.view.bounds;
    coverView.url = @"http://7xiwnz.com2.z0.glb.qiniucdn.com/signin/20160425-bg1.jpg";
    [[UIApplication sharedApplication].keyWindow addSubview:coverView];
    self.coverView = coverView;    
}


#pragma mark - 重写add方法
- (void)addChildViewController:(UIViewController *)childController{
    //拦截添加中间按钮
//    if (self.childViewControllers.count == 2 && !self.isAddedCenterBtn) {
//        self.isAddedCenterBtn = YES;
//        [self setupCenterBtn];
//    }
    
    [super addChildViewController:childController];
}


//- (void)setupCenterBtn{
//    // 将图像渲染修改为原生
//    UIViewController *publishVC = [[UIViewController alloc] init];
//    UIImage *image = [UIImage imageNamed:@"tab_publish_add"];
//    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIImage *selectImage = [UIImage imageNamed:@"tab_publish_add"];
//    selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    // 添加控制器
//    publishVC.tabBarItem.image = image;
//    publishVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_publish_add_pressed"];
//    publishVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
//    publishVC.tabBarItem.title = @"publish";
//    publishVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 10);
//    [self addChildViewController:publishVC];
//    
//}


#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
//    if (viewController.tabBarItem.tag == 2) {
//        KKImagePickerController *imagePickerVc = [[KKImagePickerController alloc] init];
//        [self presentViewController:imagePickerVc animated:YES completion:nil];
//        return NO;
//    }
//    
//    if (viewController.tabBarItem.tag == 3) {
//        KKMeViewController *loginVc = [[KKMeViewController alloc] init];
//        [self.navigationController pushViewController:loginVc animated:YES];
//        return NO;
//    }
//    
    return YES;
}





@end
