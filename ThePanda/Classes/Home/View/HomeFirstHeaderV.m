//
//  HomeFirstHeaderV.m
//  ThePanda
//
//  Created by Kenny.li on 16/7/25.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "HomeFirstHeaderV.h"


@interface HomeFirstHeaderV()

@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIView *lineView;
@end



@implementation HomeFirstHeaderV


+ (id)shareHomeFirstHeaderV:(UITableView *)tableView{
    
    NSString *ID = @"homeFirstHeaderVID";
    
    HomeFirstHeaderV *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headerView == nil) {
        headerView = [[self alloc] initWithReuseIdentifier:ID];
    }
    return headerView;
}


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]){
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.titleLabel];
        
        self.lineView = [[UIView alloc] init];
        self.lineView.backgroundColor = [UIColor redColor];
        [self addSubview:self.lineView];
        
    }
    return  self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(16, 2, self.frame.size.width, 20);
    
    self.lineView.frame = CGRectMake(8, 5, 2, 13);
    
}

- (void)setSectionTitle:(NSString *)sectionTitle{
    
    _sectionTitle = sectionTitle;
    
    self.titleLabel.text = sectionTitle;
    
    
}


@end
