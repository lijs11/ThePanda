//
//  HMBaseTool.h
//  真的是微博
//
//  Created by Kenny.li on 16/1/20.
//  Copyright (c) 2016年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HMBaseTool : NSObject

+(void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void(^)(NSError *))failure;
+(void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void(^)(NSError *))failure;

@end
