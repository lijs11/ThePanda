//
//  KKFirstscreen.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKFirstscreen : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *imgurl;
@property (nonatomic,copy) NSString *linkurl;
@property (nonatomic,copy) NSString *actiontype;
@property (nonatomic,copy) NSString *delaytime;
@property (nonatomic,copy) NSString *starttime;
@property (nonatomic,copy) NSString *endtime;

@end


/**
 
 {
	"errno": "0",
	"errmsg": "",
	"data": {
 "title": "Hello女神",
 "imgurl": "http:\/\/i7.pdim.gs\/07107e912328f51e25bcd2944eb90fac.jpg",
 "linkurl": "http:\/\/stars.panda.tv\/m\/index",
 "actiontype": "3",
 "delaytime": "3000",
 "starttime": "1465142400",
 "endtime": "1469894400"
	},
	"authseq": ""
 }
 
 */