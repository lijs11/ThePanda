//
//  HMUserTool.h
//  真的是微博
//
//  Created by Kenny.li on 16/1/20.
//  Copyright (c) 2016年 KK. All rights reserved.
//

#import "HMUser.h"
#import "HMUserInfoResult.h"
#import "HMUserInfoParam.h"
#import "HMHttpTool.h"
#import "HMBaseTool.h"

#import "HMUnreadCountParam.h"
#import "HMUnreadCountResult.h"

@interface HMUserTool : HMBaseTool
/**
 *  加载首页的微博数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */

+(void)userInfoWithParam:(HMUserInfoParam *)param success:(void (^)(HMUserInfoResult *result))success failure:(void (^)(NSError *error))failure;
+(void)unreadCountWithParam:(HMUnreadCountParam *)param success:(void (^)(HMUnreadCountResult *result))success failure:(void (^)(NSError *error))failure;

@end
