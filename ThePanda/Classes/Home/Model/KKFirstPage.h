//
//  KKFirstPage.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKFirstPage : NSObject

@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *bigimg;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *type;


@end


/**
 
 {
	"errno": "0",
	"errmsg": "",
	"data": [{
 "img": "http:\/\/i8.pdim.gs\/026388151f2ecd607784575f01ec5484.jpeg",
 "bigimg": "http:\/\/i9.pdim.gs\/026388151f2ecd607784575f01ec5484.jpeg",
 "url": "http:\/\/stars.panda.tv\/m\/index",
 "title": "Hello!女神",
 "type": "3"
	}],
	"authseq": ""
 }
 */