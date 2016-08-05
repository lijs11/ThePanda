//
//  KKNavigationController.m
//  banTangSuger
//
//  Created by Kenny.li on 16/5/28.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKNavigationController.h"

@interface KKNavigationController ()

@end

@implementation KKNavigationController


/*初始化navgationBar的样式*/
+ (void)initialize{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = HMColor(31, 139, 220, 1);
//    bar.tintColor = [UIColor whiteColor];
    bar.titleTextAttributes =@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName: @"PingFangSC-Light" size:17]};
    
}




/**1.重写push*/
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        //设置左上
       [self setupLeftBtnWithVc:viewController];
    }
    [super pushViewController:viewController animated:animated];
}

/**2.重写present*/

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    
    [self setupLeftBtnWithVc:viewControllerToPresent];
    //添加一个导航栏
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewControllerToPresent];
    
    [super presentViewController:nav animated:flag completion:completion];
}

//返回 按钮图标
- (void)setupLeftBtnWithVc:(UIViewController *)vc{
    
UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
[btn setImage:[UIImage imageNamed:@"ico_return_normal"] forState:UIControlStateNormal];
btn.size = btn.imageView.image.size;
[btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
//UIBarButtonItem *bakcItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"public_back_btn"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
vc.navigationItem.leftBarButtonItem = leftBarBtn;
    
}
//返回
- (void)back{
    
    if (self.viewControllers.count > 1) {
        [self popViewControllerAnimated:YES];
    }else {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}







/**状态栏样式*/
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}






@end
