//
//  KKHots.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKHots.h"

@implementation KKHots
+ (NSDictionary *)mj_objectClassInArray{
    
    return @{@"items":[KKItems class]};
}

//@"type" : [KKTypes class],
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
//    if ([key isEqualToString:@"id"]) {
//        self.ID = value;
//    }
//    
    
}
@end
