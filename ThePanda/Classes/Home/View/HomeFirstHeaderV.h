//
//  HomeFirstHeaderV.h
//  ThePanda
//
//  Created by Kenny.li on 16/7/25.
//  Copyright © 2016年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeFirstHeaderV : UITableViewHeaderFooterView

@property (nonatomic,copy) NSString *sectionTitle;

+ (instancetype)shareHomeFirstHeaderV:(UITableView *)tableView;

@end
