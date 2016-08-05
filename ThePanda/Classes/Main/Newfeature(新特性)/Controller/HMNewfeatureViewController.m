//
//  HMNewfeatureViewController.m
//  真的是微博
//
//  Created by Kenny.li on 16/1/9.
//  Copyright (c) 2016年 KK. All rights reserved.
//

#define HMNewfeatureImageCount 4

#import "HMNewfeatureViewController.h"
#import "KKTabBarController.h"

@interface HMNewfeatureViewController()<UIScrollViewDelegate>

@property (nonatomic,strong)UIPageControl *pageControl;

@end


@implementation HMNewfeatureViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self setupScrollView];
    [self setupPageControl];
    
}


-(void)setupScrollView{
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
//  scrollView.backgroundColor = [UIColor redColor];

    
    [self.view addSubview:scrollView];
    
    CGFloat imageW = scrollView.width;
    CGFloat imageH = scrollView.height;
    
    for (int i = 0; i < HMNewfeatureImageCount ; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *name = [NSString stringWithFormat:@"new_feature_%d",i+1];
        
//        if (FourInch) {
//            [name stringByAppendingString:@"-568h"];
//             NSLogg(@"1111");
//        }
     //   NSLogg(@"%@",name);
        
        imageView.image = [UIImage imageWithName:name];
        [scrollView addSubview:imageView];
      
        imageView.y  = 0;
        imageView.width = imageW;
        imageView.height = imageH;
        imageView.x= imageW * i;
   //     imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
 //       imageView.frame = self.view.bounds;
//        imageView.backgroundColor = [UIColor redColor];
        
        //其他属性
        scrollView.contentSize = CGSizeMake(HMNewfeatureImageCount * imageW , 0);
        scrollView.pagingEnabled = YES;
//        scrollView.bounces = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.backgroundColor = HMColor(246, 246, 246,1);
        
        if (i == HMNewfeatureImageCount - 1) {
            
            [self setupImageView:(UIImageView *)imageView];
        }
        
        
    }

    
}

-(void)setupImageView:(UIImageView *)imageView{
    
    imageView.userInteractionEnabled = YES;
    //1.设置开始按钮
    
    [self setupStarButton:(UIImageView *)imageView];
    
    //2.设置选择框
    
    [self setupShareButton:(UIImageView *)imageView];
    
}

-(void)setupStarButton:(UIImageView *)imageView{
    
    //1.创建按钮
    UIButton *startButton = [[UIButton alloc] init];
    
    //2.设置属性
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateSelected];
    [startButton setTitle:@"开始微博" forState:UIControlStateNormal];
  
    //3.设置frame
    startButton.size = startButton.currentBackgroundImage.size;
    startButton.centerX = imageView.width * 0.5;
    startButton.centerY = imageView.height *0.8;
    
    //4.监听
    [startButton addTarget:self action:@selector(startButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startButton];
    
    
    
}
-(void)startButtonClick{
    
    NSLogg(@"---startButtonClick---");
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[KKTabBarController alloc] init];
    
}


-(void)setupShareButton:(UIImageView *)imageView{
    
    //1.创建按钮
    UIButton *shareButton = [[UIButton alloc] init];
    
    //2.设置属性
    [shareButton setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareButton setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    
    //3.设置frame
    shareButton.size = CGSizeMake(150, 40);
    shareButton.centerX = imageView.width * 0.47;
    shareButton.centerY = imageView.height *0.7;
    
    //4.监听
    [shareButton addTarget:self action:@selector(shareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareButton];

    
}

-(void)shareButtonClick:(UIButton *)shareButton{
    
    NSLogg(@"---shareButtonClick---");
    shareButton.selected = !shareButton.isSelected;
    
}

-(void)setupPageControl{
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = HMNewfeatureImageCount;
    
  //  pageControl.center = CGPointMake(self.view.width * 0.5, self.view.height - 50);
    pageControl.x = self.view.width * 0.5;
    pageControl.y = self.view.height  - 50;
    [self.view addSubview:pageControl];
    
    pageControl.currentPageIndicatorTintColor = HMColor(253, 98, 42, 1);
    pageControl.pageIndicatorTintColor = HMColor(189, 189, 189, 1);
    
    self.pageControl = pageControl;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat doublePage = scrollView.contentOffset.x /scrollView.width;
    int  intPage = (int)(doublePage + 0.5);
    
    self.pageControl.currentPage = intPage;
}

@end
