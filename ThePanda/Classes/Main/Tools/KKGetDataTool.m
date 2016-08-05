//
//  KKGetDataTool.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKGetDataTool.h"

@implementation KKGetDataTool


+ (void)homeTitleDataWithParam:(KKHomeTitleScParam *)param success:(void (^)(KKHomeTitleResult *))success failure:(void (^)(NSError *))failure{
    
   
    
    NSString *url = @"http://api.m.panda.tv/ajax_get_all_subcate?__version=1.0.14.1190&__plat=ios&__channel=appstore";
    //NSDictionary *params = [param mj_keyValues];//模型 -> 字典
    
    [HMHttpTool get:url parameters:nil success:^(id responseObj) {
        //新浪返回的字典数组
     //   NSArray *statusesDictArray = responseObj[@"statuses"];
        //保存status
     //   [self saveHomeStatusDictArray:statusesDictArray accessToken:param.access_token];
        
        if (success) {
            KKHomeTitleResult *result = [KKHomeTitleResult mj_objectWithKeyValues:responseObj];
            success(result);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];

    
    
    
}



@end
