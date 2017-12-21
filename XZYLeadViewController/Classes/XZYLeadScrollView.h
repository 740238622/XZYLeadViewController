//
//  XZYLeadScrollView.h
//  XZYLeadViewController
//
//  Created by 徐自由 on 2017/12/21.
//  Copyright © 2017年 徐自由. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XZYLeadScrollViewDelegate <NSObject>
/**
 最后一页的按钮点击
 */
- (void)leadScrollViewActGoToMain;

@end

@interface XZYLeadScrollView : UIView <UIScrollViewDelegate>
{
    NSArray *sourceArr;
}

@property(strong,nonatomic) UIScrollView *scrollView;
@property(strong,nonatomic) UIPageControl *pageControl;
@property(assign,nonatomic) id <XZYLeadScrollViewDelegate> leadDelegate;


/**
 初始化

 @param frame 位置大小
 @param dataArray 引导页图片数组
 @param delegate 代理
 @return return value description
 */
- (id)initLeadScrollViewWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray delegate:(id<XZYLeadScrollViewDelegate>)delegate;

@end
