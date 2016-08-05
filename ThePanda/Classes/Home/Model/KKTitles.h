//
//  KKTitles.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKTitles : NSObject


/** 分类中文name */
@property (nonatomic,copy) NSString *cname;
/** 分类英文name */
@property (nonatomic,copy) NSString *ename;
/** 分类图片 */
@property (nonatomic,copy) NSString *img;
/** ext */
@property (nonatomic,copy) NSString *ext;
/** status */
@property (nonatomic,copy) NSString *status;



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