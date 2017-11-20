//
//  GuideViewController.m
//  cninsure_b2c
//
//  Created by xu haiming on 13-12-19.
//  Copyright (c) 2013年 zhoadaiyang. All rights reserved.
//

#import "GuideViewController.h"


//获取物理屏幕的尺寸
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface GuideViewController ()<UIScrollViewDelegate>

@property (nonatomic,retain)UIScrollView *sv;
@property(nonatomic,strong)UIPageControl *pageControl;

@end

@implementation GuideViewController
@synthesize sv=_sv;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //隐藏状态栏
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    NSArray *guideImages = @[
                             
                             @"page1.png",
                             @"page2.png",
                             @"page3.png",
                             @"page4.png"
                            
                             ];
    NSArray *progressImages = @[
                                
                                @"",
                                @"",
                                @"",
                                @"",
                             ];
    
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    sv.showsHorizontalScrollIndicator = NO;
    sv.showsVerticalScrollIndicator = NO;
    sv.contentSize = CGSizeMake(kScreenWidth*guideImages.count, kScreenHeight);
    sv.pagingEnabled = YES;
    sv.delegate = self;
    self.sv = sv;
    [self.view addSubview:sv];
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    startButton.frame = CGRectMake(kScreenWidth-150, kScreenHeight-150, 150, 150);
//    startButton.backgroundColor = [UIColor cyanColor];
//    [startButton setImage:[UIImage imageNamed:@"btnStart"] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    startButton.backgroundColor = [UIColor clearColor];
    for (int i=0; i<guideImages.count; i++) {
        NSString *guideImageName = guideImages[i];
        NSString *progressImageName = progressImages[i];
        
        //创建操作指南图片视图
        UIImageView *guideImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:guideImageName]];
        guideImageView.frame = CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight);
        if (i == (guideImages.count-1)) {
            [guideImageView addSubview:startButton];
            guideImageView.userInteractionEnabled = YES;

        }
        [sv addSubview:guideImageView];
        
        //创建进度视图
        UIImageView *progressImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:progressImageName]];
        progressImageView.frame = CGRectMake((kScreenWidth-173.0/2)/2, kScreenHeight-26.0/2-30, 173.0/2, 26.0/2);
        [guideImageView addSubview:progressImageView];
        
    }
    
    
    self.pageControl  = [[UIPageControl alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width / 2 - 50, [[UIScreen mainScreen] bounds].size.height - 50, 100, 20)];
    self.pageControl.numberOfPages = 4;
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    [self.view addSubview:self.pageControl];
    

}

-(void)startAction:(UIButton*)bnt{

    
//    [[CSIIMADPNetworkUtil sharedInstance] startTransaction:^{
//
//        [[CPMajorManager sharedInstance] startApplication:@"CPLoadPlugin/cpLoading"
//                                             withServerIP:MT_SERVER_IP
//                                           withServerPath:@"portal"];
//    }];


}
#pragma mark - UIScrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetWidth = scrollView.contentOffset.x;
    int pageNum = offsetWidth / [[UIScreen mainScreen] bounds].size.width;
    self.pageControl.currentPage = pageNum;
    
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//     //滑动到末尾，这两个值是相等的：
////    scrollView.contentOffset.x == scrollView.contentSize.width-scrollView.width;
//
//    float sub = scrollView.contentOffset.x - (scrollView.contentSize.width-scrollView.width);
//
//    if (sub > 30) {
//        //显示状态栏
//        [[UIApplication sharedApplication] setStatusBarHidden:NO];
//
////       UIWindow *window = [UIApplication sharedApplication].keyWindow;
//
//        if (self.isPrefile){
//            [self.view removeFromSuperview];
//        } else {
//            if (IPHONE) {
////                [[CSIIMADPNetworkUtil sharedInstance] startTransaction:^{
////                    [[CPMajorManager sharedInstance] startApplication:@"CPLoadPlugin/cpLoading"
////                                                         withServerIP:MT_SERVER_IP
////                                                       withServerPath:@"portal"];
////                }];
////
//
//        }
//        }
//    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
