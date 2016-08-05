//
//  KKHots.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKItems.h"
#import "KKTypes.h"

@interface KKHots : NSObject

@property (nonatomic,strong) NSNumber *total;

@property (nonatomic,strong)KKTypes *type;

@property (nonatomic,strong)NSArray *items;


@end


/**
 {
 "total": "576",
 "type": {
 "ename": "lol",
 "cname": "英雄联盟",
 "icon": "http:\/\/i5.pdim.gs\/c27cb64f975850d9388d2bd162b06861.png"
 },
 "items": [{
 "id": "6666",
 "ver": "1",
 
 */