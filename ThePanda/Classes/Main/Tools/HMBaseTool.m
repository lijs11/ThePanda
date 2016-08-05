//
//  HMBaseTool.m
//  真的是微博
//
//  Created by Kenny.li on 16/1/20.
//  Copyright (c) 2016年 KK. All rights reserved.
//

#import "HMBaseTool.h"
#import "HMHttpTool.h"
@implementation HMBaseTool
+(void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    
    NSDictionary *params = [param mj_keyValues];
    
    [HMHttpTool get:url parameters:params success:^(id responseObj) {
        
        if (success) {
            id result = [resultClass mj_objectWithKeyValues:responseObj];
            success(result);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
    
}

+(void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    
    NSDictionary *params = [param mj_keyValues];
    
    [HMHttpTool post:url parameters:params success:^(id responseObj) {
        
        if (success) {
            id result = [resultClass mj_objectWithKeyValues:responseObj];
            success(result);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
    
}
@end
