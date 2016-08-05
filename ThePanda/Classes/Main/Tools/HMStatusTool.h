//
//  HMStatusTool.h
//  真的是微博
//
//  Created by Kenny.li on 16/1/19.
//  Copyright (c) 2016年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMHomeStatusParam.h"
#import "HMHomeStatusResult.h"
#import "HMSendStatusParam.h"
#import "HMSendStatusResult.h"
#import "HMBaseTool.h"

#import "HMCommentsStatusParam.h"
#import "HMCommentsStatusResult.h"

#import "HMRepostSParam.h"
#import "HMRepostsResult.h"

@interface HMStatusTool : HMBaseTool

/**
*  加载首页的微博数据
*
*  @param param   请求参数
*  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
*  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
*/

+(void)homeStatusWithParam:(HMHomeStatusParam *)param success:(void (^)(HMHomeStatusResult *result))success failure:(void (^)(NSError *error))failure;


/**
 *  发送微博数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */

+(void)sendStatusWithParam:(HMSendStatusParam *)param success:(void (^)(HMSendStatusResult *result))success failure:(void (^)(NSError *error))failure;


/**
 *  获得评论数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */

+(void)commentsWithParam:(HMCommentsStatusParam *)param success:(void (^)(HMCommentsStatusResult *result))success failure:(void (^)(NSError *error))failure;



+(void)repostsWithParam:(HMRepostSParam *)param success:(void (^)(HMRepostsResult *))success failure:(void (^)(NSError *))failure;


@end
