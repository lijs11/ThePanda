//
//  KKAboutViewController.m
//  小帮手
//
//  Created by Kenny.li on 16/5/22.
//  Copyright (c) 2016年 KK. All rights reserved.
//

#import "KKAboutViewController.h"

@interface KKAboutViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *aboutImage;
@property (weak, nonatomic) IBOutlet UILabel *labelT;

@end

@implementation KKAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setLeftBtnNav];
    
    self.title = @"关于";
//    CGFloat top = 0; // 顶端盖高度
//    CGFloat bottom = 0 ; // 底端盖高度
//    CGFloat left = 25; // 左端盖宽度
//    CGFloat right = 0; // 右端盖宽度
//    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 指定为拉伸模式，伸缩后重新赋值
//    UIImage *bgImage = [UIImage imageNamed:@"btn_line_round_edg_hover.9"];
//   
//  //  bgImage = [bgImage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
//    UIColor *color = [UIColor colorWithPatternImage:bgImage];
//    [self.labelT setBackgroundColor:color];
    
    self.labelT.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.labelT.layer.borderWidth = 0.3;
    self.labelT.layer.cornerRadius = 5;

}



- (void)setLeftBtnNav{
    

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"ico_return_normal"] forState:UIControlStateNormal];
    btn.size = btn.imageView.image.size;
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    //UIBarButtonItem *bakcItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"public_back_btn"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    self.navigationItem.leftBarButtonItem = leftBarBtn;
    
}

//返回
- (void)back{
    
        [self.navigationController popViewControllerAnimated:YES];
}

@end
