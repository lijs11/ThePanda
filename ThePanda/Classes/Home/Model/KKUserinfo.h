//
//  KKUserinfo.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKUserinfo : NSObject
@property (nonatomic,copy) NSString *nickName;
@property (nonatomic,copy) NSString *rid;
@property (nonatomic,copy) NSString *avatar;
@property (nonatomic,copy) NSString *userName;
@end

/**
 "userinfo": {
 "nickName": "即将拥有人鱼线的PDD",
 "rid": 5947128,
 "avatar": "http:\/\/i6.pdim.gs\/fe6c1edaa50f1ae3f346f0452a9254ed.jpeg",
 "userName": "PandaTv5947128"
 */