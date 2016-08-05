//
//  HMAccountTool.h
//  真的是微博
//
//  Created by Kenny.li on 16/1/11.
//  Copyright (c) 2016年 KK. All rights reserved.
//
@class HMAccount;
#import <Foundation/Foundation.h>
#import "HMAccessTokenParam.h"
#import "HMBaseTool.h"

@interface HMAccountTool : HMBaseTool

+(void)save:(HMAccount *)account;
+(HMAccount *)account;


+(void)accessTokenWithParam:(HMAccessTokenParam *)param success:(void (^)(HMAccount *account))success failure:(void (^)(NSError *error))failure;

@end
