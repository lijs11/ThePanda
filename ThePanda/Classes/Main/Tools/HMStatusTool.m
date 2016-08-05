//
//  HMStatusTool.m
//  真的是微博
//
//  Created by Kenny.li on 16/1/19.
//  Copyright (c) 2016年 KK. All rights reserved.
//

#import "HMStatusTool.h"
#import "HMHttpTool.h"
#import "MJExtension.h"
#import "FMDB.h"
#import "HMStatus.h"
#import "HMAccountTool.h"
#import "HMAccount.h"

//数据库字段
/***
 id
 access_token
 status_idstr
 status_dict 每条微博返回状态字典
 ***/

@implementation HMStatusTool


static FMDatabase *_db;

+ (void)initialize
{
    // 1.获得数据库文件的路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filename = [doc stringByAppendingPathComponent:@"status.sqlite"];
    
    // 2.得到数据库
    _db = [FMDatabase databaseWithPath:filename];
    
    // 3.打开数据库
    if ([_db open]) {
        // 4.创表
        BOOL result = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_home_status (id integer PRIMARY KEY AUTOINCREMENT, access_token text NOT NULL, status_idstr text NOT NULL, status_dict blob NOT NULL);"];
        if (result) {
            NSLog(@"成功创表");
        } else {
            NSLog(@"创表失败");
        }
    }
}



+(void)homeStatusWithParam:(HMHomeStatusParam *)param success:(void (^)(HMHomeStatusResult *result))success failure:(void (^)(NSError *error))failure{
    
    //从数据库中取缓存(微博模型数组)
     NSArray *cachedHomeStatusesArray = [self cachedHomeStatusesWithParam:param];
    if (cachedHomeStatusesArray.count != 0) {//有缓存
        if (success) {
            HMHomeStatusResult *result = [[HMHomeStatusResult alloc] init];
            result.statuses = cachedHomeStatusesArray;
            success(result);
        }
       
       
    }else{//没有缓存,不封死，联网之后加入缓存
//    [self getWithUrl:url param:param resultClass:[HMHomeStatusResult class] success:success failure:failure];
        
        NSString *url = @"https://api.weibo.com/2/statuses/home_timeline.json";
        NSDictionary *params = [param mj_keyValues];//模型 -> 字典
        
        [HMHttpTool get:url parameters:params success:^(id responseObj) {
            //新浪返回的字典数组
            NSArray *statusesDictArray = responseObj[@"statuses"];
            //保存status
            [self saveHomeStatusDictArray:statusesDictArray accessToken:param.access_token];
            
            if (success) {
                HMHomeStatusResult *result = [HMHomeStatusResult mj_objectWithKeyValues:responseObj];
                success(result);
            }
            
        } failure:^(NSError *error) {
            
            if (failure) {
                failure(error);
            }
            
        }];
  
    }

}

//保存过程
/**
 *  缓存微博字典数组到数据库中
 */
+ (void)saveHomeStatusDictArray:(NSArray *)statusDictArray accessToken:(NSString *)accessToken
{
    for (NSDictionary *statusDict in statusDictArray) {
        // 把statusDict字典对象序列化成NSData二进制数据
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:statusDict];
        [_db executeUpdate:@"INSERT INTO t_home_status (access_token, status_idstr, status_dict) VALUES (?, ?, ?);",
         accessToken, statusDict[@"idstr"], data];
    }
}



//通过请求参数加载数据，加载多少条等
+ (NSArray *)cachedHomeStatusesWithParam:(HMHomeStatusParam *)param{
    
    // 创建数组缓存微博数据
    NSMutableArray *statuses = [NSMutableArray array];
    
    // 根据请求参数查询数据
    FMResultSet *resultSet = nil;
    if (param.since_id) {
        resultSet = [_db executeQuery:@"SELECT * FROM t_home_status WHERE access_token = ? AND status_idstr > ? ORDER BY status_idstr DESC limit ?;", param.access_token, param.since_id, param.count];
    } else if (param.max_id) {
        resultSet = [_db executeQuery:@"SELECT * FROM t_home_status WHERE access_token = ? AND status_idstr <= ? ORDER BY status_idstr DESC limit ?;", param.access_token, param.max_id, param.count];
    } else {
        resultSet = [_db executeQuery:@"SELECT * FROM t_home_status WHERE access_token = ? ORDER BY status_idstr DESC limit ?;", param.access_token, param.count];
    }
    // 遍历查询结果
    while (resultSet.next) {
    NSData *statusDictData = [resultSet objectForColumnName:@"status_dict"];
    NSDictionary *statusDict = [NSKeyedUnarchiver unarchiveObjectWithData:statusDictData];
    // 字典转模型
    HMStatus *status = [HMStatus mj_objectWithKeyValues:statusDict];
    // 添加模型到数组中
    [statuses addObject:status];
    }
    return statuses;
}




+(void)sendStatusWithParam:(HMSendStatusParam *)param success:(void (^)(HMSendStatusResult *))success failure:(void (^)(NSError *))failure{
    
    
    NSString *url = @"https://api.weibo.com/2/statuses/update.json";
    
    [self postWithUrl:url param:param resultClass:[HMSendStatusResult class] success:success failure:failure];
    
}

+ (void)commentsWithParam:(HMCommentsStatusParam *)param success:(void (^)(HMCommentsStatusResult *))success failure:(void (^)(NSError *))failure{
    
    NSString *url = @"https://api.weibo.com/2/comments/show.json";
    
    [self getWithUrl:url param:param resultClass:[HMCommentsStatusResult class] success:success failure:failure];
    
    
}


+ (void)repostsWithParam:(HMRepostSParam *)param success:(void (^)(HMRepostsResult *))success failure:(void (^)(NSError *))failure{
    
    [self getWithUrl:@"https://api.weibo.com/2/statuses/repost_timeline.json" param:param resultClass:[HMRepostsResult class] success:success failure:failure];
    
}




@end
