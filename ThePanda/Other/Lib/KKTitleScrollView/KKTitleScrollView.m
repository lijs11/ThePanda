//
//  KKTitleScrollView.m
//  banTangSuger
//
//  Created by Kenny.li on 16/5/30.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "KKTitleScrollView.h"
#import "Masonry.h"

@interface KKTitleScrollView()
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,strong)UIView *redLine;
@property (nonatomic,assign) CGFloat subWidth;
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,assign) NSInteger lastIndex;
@end


@implementation KKTitleScrollView


- (void)selectItemAtIndex:(NSInteger)index{
    
    [self scrollViewToTapIndex:index];
    
//    if (self.delegate) {//避免重复提醒，自动选的不通知代理了
//        [self.delegate titleScrollViewDidClicked:self atIndex:index];
//    }
//    
    
}




- (instancetype)initWithTitleArray:(NSArray *)titleArray titleSubWidth:(CGFloat)subWidth{
    if (self = [super init]) {
        
        self.subWidth = subWidth;
      
        
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator = NO;
     //   scrollView.showsVerticalScrollIndicator = NO;
        
        scrollView.backgroundColor = [UIColor whiteColor];
        [self addSubview:scrollView];
        self.scrollView = scrollView;
       
        
        UIView *contentView = [[UIView alloc] init];
        contentView.backgroundColor = [UIColor whiteColor];
        [scrollView addSubview:contentView];
        self.contentView = contentView;
        
        self.backgroundColor = [UIColor whiteColor];
        
        //设置自动布局
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
           // make.top.mas_equalTo(self.mas_top);
           // make.height.mas_equalTo(self.mas_height);
        }];
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.scrollView);
//            make.top.mas_equalTo(self.scrollView.mas_top).offset(10);
//            make.bottom.mas_equalTo(self.scrollView.mas_bottom).offset(-10);
        //    make.leading.mas_equalTo(self.scrollView);
//            make.trailing.mas_equalTo(self.scrollView).offset(-10);
        }];
        
        
//        self.scrollView.contentSize = CGSizeMake(subWidth * titleArray.count, 45);
//       // self.scrollView.bounces = NO;
//        self.scrollView.contentInset = UIEdgeInsetsMake(-10, 0, 0, 0);
//        
        [self updateSubViewsWithTitleArray:titleArray titleSubWidth:subWidth];
        
        
    }
    
    return self;
    
}


- (void)updateSubViewsWithTitleArray:(NSArray *)titleArray titleSubWidth:(CGFloat)subWidth{
    
    self.subWidth = subWidth;
    
    if (titleArray.count == 0 || (subWidth < 0)) return;
    
    
    for (UIView *subV in self.contentView.subviews) {
        [subV removeFromSuperview];
    }
    
    
    //设置自动布局
    [self.scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
        // make.top.mas_equalTo(self.mas_top);
        // make.height.mas_equalTo(self.mas_height);
    }];
    
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.scrollView);
        // make.leading.top.mas_equalTo(self.scrollView);
       // make.height.mas_equalTo(self.scrollView.mas_height);
    }];
    
    
    
    
    //添加每个标题
    for (int i = 0; i < titleArray.count; i++) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = titleArray[i];
        titleLabel.font = [UIFont fontWithName:@"PingFangSC-Thin" size:14];
        titleLabel.highlighted = NO;//默认都不选
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(LableClickedByTap:)];
        titleLabel.userInteractionEnabled = YES;
        titleLabel.highlightedTextColor = [UIColor redColor];
        [titleLabel addGestureRecognizer:tap];
        
        titleLabel.tag = i;
        [self.contentView addSubview:titleLabel];
    }
    
    //底部红色线
    UIView *redLine = [[UIView alloc] init];
    redLine.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:redLine];
    self.redLine = redLine;
    
   
    
    //Label布局
    UILabel *lastLable;//存放取出的Label
    for (NSInteger i = 0; i < self.contentView.subviews.count - 1; i++) {//去掉最后一个
        UILabel *label = self.contentView.subviews[i];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(lastLable?lastLable.mas_trailing:@0);
            make.width.mas_equalTo(subWidth);
            make.height.mas_equalTo(40);
            make.centerY.equalTo(self.contentView);
        }];
        
        lastLable = label;//每次布局完一个变换角色
    }

   
   
//    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.trailing.equalTo(lastLable);
//        make.top.mas_equalTo(self.scrollView.mas_top);
//    }];
    
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(lastLable);
        make.height.mas_equalTo(45);
        make.width.mas_equalTo(subWidth * titleArray.count);
    }];
    
    

    
    //设置第一个Label 默认选中
    UILabel *firstLable = self.contentView.subviews[0];
    firstLable.highlighted = YES;
    firstLable.font = [UIFont fontWithName:@"PingFangSC-Thin" size:14];
    //红色线移到第一个
    [redLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(subWidth * 0.6);
        make.height.mas_equalTo(2);
        make.centerX.mas_equalTo(firstLable);
        make.top.equalTo(firstLable.mas_bottom);
    }];
    
    //默认选择第一个
    self.lastIndex = 0;
    
    
}







- (void)LableClickedByTap:(UITapGestureRecognizer *)tap{
    
    NSInteger index = tap.view.tag;
    [self scrollViewToTapIndex:index];
    
    if (self.delegate) {
        [self.delegate titleScrollViewDidClicked:self atIndex:index];
    }
    
    
}

//滚到Tap的那个Label
- (void)scrollViewToTapIndex:(NSInteger)index{
//    for (NSInteger i = 0; i < _contentView.subviews.count - 1; i ++) {
//        UILabel *label = _contentView.subviews[i];
//        label.highlighted = NO;
//        label.font = [UIFont systemFontOfSize:14];
//    }
//    
//    UILabel *label = self.contentView.subviews[index];
//    [self.redLine mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(self.subWidth * 0.6);
//        make.height.mas_equalTo(2);
//        make.centerX.equalTo(label);
//        make.top.equalTo(label.mas_bottom);
//    }];
//    [self.redLine setNeedsLayout];
//    [UIView animateWithDuration:0.5 animations:^{
//        [self.redLine layoutIfNeeded];
//        label.highlighted = YES;
//        label.font = [UIFont systemFontOfSize:14];
//    }];
//    
//    // 当能够滑动的时候才设置偏移量
//    if (self.scrollView.contentSize.width > self.scrollView.frame.size.width) {
//        CGFloat leftOffset = CGRectGetMidX(label.frame) - CGRectGetWidth(self.bounds) / 2;
//        CGFloat rightOffset = CGRectGetWidth(self.bounds) / 2 + CGRectGetMidX(label.frame) - CGRectGetWidth(self.contentView.frame);
//        // 偏移量
//        if (leftOffset >= 0 && rightOffset <= 0) {
//            [self.scrollView setContentOffset:CGPointMake(leftOffset, 0) animated:YES];
//        }else{
//            [self.scrollView setContentOffset:CGPointMake((leftOffset >= 0? :0), 0) animated:YES];
//            [self.scrollView setContentOffset:CGPointMake((rightOffset <= 0? :CGRectGetWidth(self.contentView.frame) - CGRectGetWidth(self.bounds)), 0) animated:YES];
//            NSLog(@"%lf %lf",CGRectGetWidth(self.contentView.frame),CGRectGetWidth(self.bounds));
//        }
//    }
    

//    for (NSInteger i = 0; i < _contentView.subviews.count - 1; i ++) {
//        UILabel *label = _contentView.subviews[i];
//        label.highlighted = NO;
//        label.font = [UIFont systemFontOfSize:14];
//    }
    

    UILabel *selectedLabel = self.contentView.subviews[index];
    UILabel *lastLabel = self.contentView.subviews[self.lastIndex];
    
    self.lastIndex = index;
    
    [self.redLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.subWidth * 0.6);
        make.height.mas_equalTo(2);
        make.centerX.equalTo(selectedLabel);
        make.top.equalTo(selectedLabel.mas_bottom);
    }];
    [self.redLine setNeedsLayout];
    [UIView animateWithDuration:0.5 animations:^{
        [self.redLine layoutIfNeeded];
        
        lastLabel.highlighted = NO;
        lastLabel.font = [UIFont fontWithName:@"PingFangSC-Thin" size:14];
        
        selectedLabel.highlighted = YES;
        selectedLabel.font = [UIFont fontWithName:@"PingFangSC-Thin" size:14];
    }];

    // 当能够滑动的时候才设置偏移量
    if (self.scrollView.contentSize.width > self.scrollView.frame.size.width) {
        CGFloat leftOffset = CGRectGetMidX(selectedLabel.frame) - CGRectGetWidth(self.bounds) / 2;
        CGFloat rightOffset = CGRectGetWidth(self.bounds) / 2 + CGRectGetMidX(selectedLabel.frame) - CGRectGetWidth(self.contentView.frame);
        // 偏移量
        if (leftOffset >= 0 && rightOffset <= 0) {
            [self.scrollView setContentOffset:CGPointMake(leftOffset, 0) animated:YES];
        }else{
            [self.scrollView setContentOffset:CGPointMake((leftOffset >= 0? :0), 0) animated:YES];
            [self.scrollView setContentOffset:CGPointMake((rightOffset <= 0? :CGRectGetWidth(self.contentView.frame) - CGRectGetWidth(self.bounds)), 0) animated:YES];
//            NSLog(@"%lf %lf",CGRectGetWidth(self.contentView.frame),CGRectGetWidth(self.bounds));
        }
    }
    
    
    
    
   
}





@end
