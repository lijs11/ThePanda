//
//  HMHttpTool.m
//  真的是微博
//
//  Created by Kenny.li on 16/1/18.
//  Copyright (c) 2016年 KK. All rights reserved.
//

#import "HMHttpTool.h"

@implementation HMHttpTool



+ (void)get:(NSString *)url parameters:(NSDictionary *)params success:(void (^)(id responseObj))success failure: (void(^)(NSError *error))failure{
    
    //发送一个GET请求
    //获取管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    [mgr GET:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         failure(error);
    }];
    
    
    

    
    
}
+ (void)post:(NSString *)url parameters:(NSDictionary *)params success:(void (^)(id responseObj))success failure: (void(^)(NSError *error))failure{
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    [mgr POST:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
    
    
}


/***发图片专用**/
+ (void)post:(NSString *)url parameters:(NSDictionary *)params constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> formData))block success:(void (^)(id responseObj))success failure: (void(^)(NSError *error))failure{

    //获取管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];

    
    
    [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        block(formData);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
    
 

}


@end
