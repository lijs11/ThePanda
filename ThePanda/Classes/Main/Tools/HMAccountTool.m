//
//  HMAccountTool.m
//  真的是微博
//
//  Created by Kenny.li on 16/1/11.
//  Copyright (c) 2016年 KK. All rights reserved.
//

#define  HMAccountFilepath   [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"oauthAccount.data"]

#import "HMAccountTool.h"
#import "HMAccount.h"

@implementation HMAccountTool


+(void)save:(HMAccount *)account{
    
        //直接把模型存到对象里面去 归档器
    [NSKeyedArchiver archiveRootObject:account toFile:HMAccountFilepath];
    
}
+(HMAccount *)account{
    
    
    //解档
    HMAccount *account =[NSKeyedUnarchiver unarchiveObjectWithFile:HMAccountFilepath];
    
    NSDate *now = [NSDate date];
    
    
    /*NSOrderedAscending = -1L, 升序
     *NSOrderedSame,            一样
     *NSOrderedDescending       降序
     */

    //判断过期
    if ([now compare:account.expires_time]== NSOrderedDescending) {
        
        account =nil;
        
    }
   return account;
    
}

+ (void)accessTokenWithParam:(HMAccessTokenParam *)param success:(void (^)(HMAccount *))success failure:(void (^)(NSError *))failure{
    
    [self postWithUrl:@"https://api.weibo.com/oauth2/access_token" param:param resultClass:[HMAccount class] success:success failure:failure];
    
    
    
    
}

@end
