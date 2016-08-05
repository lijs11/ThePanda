//
//  KKItems.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKItems.h"

@implementation KKItems


+ (NSDictionary *)mj_objectClassInArray{
    
    return @{@"userinfo" : [KKUserinfo class]};
}

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"ID" : @"id"};
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
       // self.roomID = value;
    }
    
    
}
@end
