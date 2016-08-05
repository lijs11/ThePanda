//
//  AppDelegate.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/21.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "AppDelegate.h"
#import "KKTabBarController.h"
#import "HMControllerTool.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //1.第三方
    [self setupUM];
    
    
    
    //2.window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    //HMAccount *account = [HMAccountTool account];
    
    [HMControllerTool chooseRootViewController];
    
    //    if (account) {
    //
    //        [HMControllerTool chooseRootViewController];
    //
    //    }else{
    //
    //        self.window.rootViewController = [[HMOAuthViewController alloc]init];
    //
    //    }
    
    
    
    //3.判断网络
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        /**
         AFNetworkReachabilityStatusUnknown          = -1,
         AFNetworkReachabilityStatusNotReachable     = 0,
         AFNetworkReachabilityStatusReachableViaWWAN = 1,
         AFNetworkReachabilityStatusReachableViaWiFi = 2,
         */
        
        switch (status) {
                
            case AFNetworkReachabilityStatusUnknown:
                NSLogg(@"---未知网络---");
                [MBProgressHUD showError:@"网络异常，请检查设置！"];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLogg(@"---没有网络---");
                [MBProgressHUD showError:@"网络异常，请检查设置！"];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLogg(@"---手机自带网络上网---");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLogg(@"---使用WiFi上网---");
                break;
        }
    }];
    
    [mgr startMonitoring];
    
    
    
    //4.获得用户允许发送通知
    if (IOS7) {
        
        UIUserNotificationType type=UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound;
        UIUserNotificationSettings *setting=[UIUserNotificationSettings settingsForTypes:type categories:nil];
        [[UIApplication sharedApplication]registerUserNotificationSettings:setting];
        
    }
    
    
    
    
    return YES;
}


- (void)setupUM{
    
    
    
}












- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
