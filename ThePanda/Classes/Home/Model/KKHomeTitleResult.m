//
//  KKHomeTitleResult.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/24.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKHomeTitleResult.h"

@implementation KKHomeTitleResult

+ (NSDictionary *)mj_objectClassInArray{
    
    return @{@"data" : [KKTitles class]};
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"errno"]) {
        self.errno1 = value;
    }
    
}

@end
