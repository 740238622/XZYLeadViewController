//
//  XZYLeadScrollView.m
//  XZYLeadViewController
//
//  Created by 徐自由 on 2017/12/21.
//  Copyright © 2017年 徐自由. All rights reserved.
//

#import "XZYLeadScrollView.h"

@implementation XZYLeadScrollView

@synthesize scrollView;
@synthesize pageControl;
@synthesize leadDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

#pragma mark- init methods
- (id)initLeadScrollViewWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray delegate:(id<XZYLeadScrollViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        sourceArr = dataArray;
        self.userInteractionEnabled = YES;
        leadDelegate=delegate;
        [self initSubviewsWithFrame:frame];
    }
    return self;
}

-(void)initSubviewsWithFrame:(CGRect)frame
{
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    CGRect fitRect = CGRectMake(0, 0, width, height);
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:fitRect];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(width*(sourceArr.count), height);
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView];
    
    
    for (int i = 0; i < sourceArr.count; i++) {
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(width*(i), 0, width, height)];
        imageview.backgroundColor = [UIColor orangeColor];
        NSString *imageStr = sourceArr[i];
        [imageview setImage:[UIImage imageNamed:imageStr]];
        
        [self.scrollView addSubview:imageview];
        
        if (i == sourceArr.count - 1) {
            imageview.userInteractionEnabled = YES;
//            UIButton *btn = [MyUtil buttonPhotoAlignment:nil hilPhoto:nil rect:CGRectMake((width-140)/2, height-70, 140, 30) title:@"" select:nil Tag:0 View:imageview textColor:White Size:[UIFont systemFontOfSize:20]];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake((width - 140)/2, height - 70, 140, 30);
            
            [btn addTarget:self action:@selector(actGoToMain) forControlEvents:UIControlEventTouchUpInside];
            btn.layer.cornerRadius=6;
            [imageview addSubview:btn];
        }
        
    }
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, height-40, width, 30)];
    self.pageControl.numberOfPages = sourceArr.count;
    self.pageControl.currentPage = 0;
    self.pageControl.enabled = YES;
    self.pageControl.currentPageIndicatorTintColor=[UIColor orangeColor];
    self.pageControl.pageIndicatorTintColor=[UIColor grayColor];
    
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, width, height) animated:NO];
}
#pragma mark - 立即进入按钮
- (void)actGoToMain
{
    if (leadDelegate&&[leadDelegate respondsToSelector:@selector(leadScrollViewActGoToMain)]) {
        [leadDelegate leadScrollViewActGoToMain];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat width = self.scrollView.frame.size.width;
    CGFloat heigth = self.scrollView.frame.size.height;
    //当手指滑动scrollview，而scrollview减速停止的时候 开始计算当前的图片的位置
    NSInteger currentPage = self.scrollView.contentOffset.x/width;
    [self.scrollView scrollRectToVisible:CGRectMake(width*currentPage, 0, width, heigth) animated:NO];
    self.pageControl.currentPage = currentPage;
}

@end
