//
//  KKItems.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKUserinfo.h"

@interface KKItems : NSObject

@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *ver;
@property (nonatomic,copy) NSString *createtime;
@property (nonatomic,copy) NSString *updatetime;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *hostid;
@property (nonatomic,copy) NSString *person_num;

@property (nonatomic,copy) NSString *announcement;
@property (nonatomic,copy) NSString *smallimg;
@property (nonatomic,copy) NSDictionary *classification;
@property (nonatomic,strong) NSDictionary *pictures;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *start_time;
@property (nonatomic,copy) NSString *end_time;
@property (nonatomic,copy) NSString *duration;
@property (nonatomic,copy) NSString *schedule;
@property (nonatomic,copy) NSString *remind_switch;
@property (nonatomic,copy) NSString *remind_content;
@property (nonatomic,copy) NSString *level;
@property (nonatomic,copy) NSString *stream_status;
@property (nonatomic,copy) NSString *classify_switch;

@property (nonatomic,copy) NSString *reliable;
@property (nonatomic,copy) NSString *banned_reason;
@property (nonatomic,copy) NSString *unlock_time;
@property (nonatomic,copy) NSString *speak_interval;
@property (nonatomic,copy) NSString *person_num_thres;
@property (nonatomic,copy) NSString *reduce_ratio;
@property (nonatomic,copy) NSString *person_switch;
@property (nonatomic,copy) NSString *watermark_switch;

@property (nonatomic,copy) NSString *watermark_loc;
@property (nonatomic,copy) NSString *account_status;
@property (nonatomic,copy) NSString *person_src;
@property (nonatomic,copy) NSString *display_type;
@property (nonatomic,copy) NSString *tag;
@property (nonatomic,copy) NSString *tag_switch;
@property (nonatomic,copy) NSString *tag_color;
@property (nonatomic,copy) NSString *room_key;
@property (nonatomic,copy) NSString *fans;
@property (nonatomic,strong) KKUserinfo *userinfo;


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
 "createtime": "2016-06-23 01:54:53",
 "updatetime": "2016-07-19 22:59:20",
 "name": "输一次1W红包1个房管~弹幕抽",
 "hostid": "5947128",
 "person_num": "1618842",
 "announcement": "",
 "classification": {
 "cname": "英雄联盟",
 "ename": "lol"
 },
 "pictures": {
 "img": "http:\/\/i8.pdim.gs\/45\/90d446c8d00ccc765a59dff7fb405b84\/w338\/h190.jpg"
 },
 "status": "2",
 "start_time": "1468928396",
 "end_time": "1468929232",
 "duration": "11993",
 "schedule": "0",
 "remind_switch": "1",
 "remind_content": "",
 "level": "9",
 "stream_status": "1",
 "classify_switch": "1",
 "reliable": "1",
 "banned_reason": "",
 "unlock_time": "0",
 "speak_interval": "2",
 "person_num_thres": "0",
 "reduce_ratio": "0",
 "person_switch": "0",
 "watermark_switch": "2",
 
 "watermark_loc": "1",
 "account_status": "1",
 "person_src": "1",
 "display_type": "1",
 "tag": "",
 "tag_switch": "1",
 "tag_color": "1",
 "room_key": "d484e9848e75e85be0859ba29f0c6850",
 "fans": "0",
 "userinfo": {
 "nickName": "即将拥有人鱼线的PDD",
 "rid": 5947128,
 "avatar": "http:\/\/i6.pdim.gs\/fe6c1edaa50f1ae3f346f0452a9254ed.jpeg",
 "userName": "PandaTv5947128"
 }
 }
 
 
 */