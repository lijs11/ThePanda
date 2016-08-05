//
//  KKWaterFlowCell.m
//  banTangSuger
//
//  Created by Kenny.li on 16/7/3.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKWaterFlowCell.h"

@interface KKWaterFlowCell()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *peopleNum;
@property (weak, nonatomic) IBOutlet UIImageView *peopleIma;

@end

@implementation KKWaterFlowCell




- (void)setItem:(KKItems *)item{
    
    _item = item;
    
    if (item == nil) return;
    
    //主要图片
    NSString *img = item.pictures[@"img"];
    if (img) {
    [self.ImageView sd_setImageWithURL:[NSURL URLWithString:img] placeholderImage:nil];
    }
    
    //标题
    self.title.text = item.name;
    //name
    KKUserinfo *userInfo = item.userinfo;
    self.name.text = userInfo.nickName;
    //人数
    
    self.peopleNum.text = [self setupBtnTitleCount:item.person_num];
    
   // NSLogg(@"%@",item.name);
//    self.title.text = item.name;
//    self.likeLabel.text = item.fans;
    
}



- (NSString *)setupBtnTitleCount:(NSString *)count{
    
    NSInteger counts = [count integerValue];
    NSString *defaultTitle;
    if (counts > 10000) {
        defaultTitle = [NSString stringWithFormat:@"%.1f万",counts / 10000.0];
        defaultTitle = [defaultTitle stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }else if (counts > 0){
        defaultTitle = [NSString stringWithFormat:@"%ld",(long)counts];
    }
    
    return defaultTitle;
}





- (void)awakeFromNib {
    // Initialization code
}

@end
