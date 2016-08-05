//
//  HMControllerTool.m
//  真的是微博
//
//  Created by Kenny.li on 16/1/11.
//  Copyright (c) 2016年 KK. All rights reserved.
//

#import "HMControllerTool.h"
#import "KKTabBarController.h"
#import "HMNewfeatureViewController.h"

@implementation HMControllerTool

+(void)chooseRootViewController{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow ;
    window.rootViewController = [[KKTabBarController alloc]init];
    
//    //   NSString *versionKey = @"CFBundleVersion";
//    //  kCFBundleVersionKey
//    NSString *versionKey = (__bridge NSString*)kCFBundleVersionKey;
//    
//    
//    //   NSString *versionKey1=@"123213";
//    //   CFStringRef *str = (__bridge CFStringRef) versionKey1;
//    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *lastVersion =[defaults objectForKey:versionKey];
//    
//    NSString *currentVersion =[NSBundle mainBundle].infoDictionary[versionKey];
//    //    NSLogg(@"%@",[NSBundle mainBundle].infoDictionary);
//    
//    UIWindow *window = [UIApplication sharedApplication].keyWindow ;
//    
//    if ([lastVersion isEqual:currentVersion]) {
//        window.rootViewController = [[KKTabBarController alloc]init];
//    }else{
//        
//        window.rootViewController = [[HMNewfeatureViewController alloc]init];
//        
//        
//        //立刻保存数据
//        [defaults setObject:currentVersion forKey:versionKey];
//        [defaults synchronize];
//    }
    
}
    
@end
