//
//  HMUserTool.m
//  真的是微博
//
//  Created by Kenny.li on 16/1/20.
//  Copyright (c) 2016年 KK. All rights reserved.
//

#import "HMUserTool.h"
#import "HMBaseTool.h"

@implementation HMUserTool

+(void)userInfoWithParam:(HMUserInfoParam *)param success:(void (^)(HMUserInfoResult *result))success failure:(void (^)(NSError *error))failure{
    
    [self getWithUrl:@"https://api.weibo.com/2/users/show.json" param:param resultClass:[HMUserInfoResult class] success:success failure:failure];
   
}

+(void)unreadCountWithParam:(HMUnreadCountParam *)param success:(void (^)(HMUnreadCountResult *))success failure:(void (^)(NSError *))failure{
    
    [self getWithUrl:@"https://rm.api.weibo.com/2/remind/unread_count.json" param:param resultClass:[HMUnreadCountResult class] success:success failure:failure];
    
}
@end
