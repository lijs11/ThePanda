//
//  KKHomeTitleResult.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKTitles.h"
@interface KKHomeTitleResult : NSObject

@property (nonatomic,strong)NSNumber *errno1;
@property (nonatomic,copy) NSString *errmsg;

@property (nonatomic,strong)NSArray *data;


@end

/**
 {
	"errno": 0,
	"errmsg": "",
	"data": [{
 "cname": "英雄联盟",
 "ename": "lol",
 "img": "http:\/\/i2.pdim.gs\/t01d71f763f4f2ca03c.png",
 "ext": "1000",
 "status": "1"
	}, {
 "cname": "娱乐联萌",
 "ename": "yzdr",
 "img": "http:\/\/i0.pdim.gs\/t01df1536c56c19d530.png",
 "ext": "1001",
 "status": "1"
	}, {
	
 
 */