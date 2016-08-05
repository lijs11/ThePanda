//
//  KKGetDataTool.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "HMBaseTool.h"

#import "KKHomeTitleScParam.h"
#import "KKHomeTitleResult.h"

@interface KKGetDataTool : HMBaseTool
/**
 *  加载首页的微博数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */

+(void)homeTitleDataWithParam:(KKHomeTitleScParam *)param success:(void (^)(KKHomeTitleResult *result))success failure:(void (^)(NSError *error))failure;


@end
