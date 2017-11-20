//
//  CSIITabBarViewController.m
//  MobileClientDemo
//
//  Created by 曲正平 on 15/7/12.
//  Copyright (c) 2015年 曲正平. All rights reserved.
//

#import "CSIITabBarViewController.h"
#import "ViewController.h"
//ScreenWidth/4
#define TabButtonWidth     (float)(135*49/120)
#define TabButtonHeight     49
#define SaoYiSaoWidth    57
#define SaoYiSaoHeight    84
#define StartX      0
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
@interface CSIITabBarViewController ()

@end
@implementation CSIITabBarViewController{
    
    UIView *bottomMenuView;
    NSMutableArray * tabBars;
    
    NSMutableArray *_buttonArray;
    
    NSInteger logoutCount;
}

#pragma mark - 多步导航跳转
- (void)navgitionStepAndIndex:(UIButton *)sender{
    for (UIButton *tempBtn in _buttonArray) {
        tempBtn.selected = NO;
    }
    sender.selected = YES;
    self.selectedIndex = sender.tag;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*商圈定位*/
    //    [self testLocationService];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toMTloginVC) name:@"MTloginVC" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toLoginDirct) name:@"BackgroundtologinDirect" object:nil];
    
    
    tabBars = [[NSMutableArray alloc]init];
    
    [self tabberView];
    
    if([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)selectTabWithIndex:(NSInteger) index{
    if(index < [_buttonArray count]){
        self.selectedIndex = index;
        [self refrashBottomButton];
    }
}

- (void)tabberView{
    
    
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//    [[UINavigationBar appearance] setBackgroundImage:IMAGE(@"navbackground") forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navbackground"] forBarMetrics:UIBarMetricsDefault];

    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/2-50, 20, 99, 33)];
//    logoView.image = IMAGE(@"logoo");
    logoView.image = [UIImage imageNamed:@"logoo"];

    //    [tabBars addSubview:logoView];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    self.tabBar.userInteractionEnabled=NO;
    [_buttonArray removeAllObjects];
    _buttonArray = nil;
    _buttonArray = [[NSMutableArray alloc] initWithCapacity:0];
    [tabBars removeAllObjects];
    
    ViewController *fvc = [[ViewController alloc]init];
    UINavigationController *fnvc = [[UINavigationController alloc]initWithRootViewController:fvc];
    
    
    ViewController *cvc = [[ViewController alloc]init];
    UINavigationController *cnvc = [[UINavigationController alloc]initWithRootViewController:cvc];
    
    ViewController *loanVC= [[ViewController alloc]init];
    UINavigationController *loanNv = [[UINavigationController alloc]initWithRootViewController:loanVC];
    
    ViewController *lvc = [[ViewController alloc]init];
    UINavigationController *lnvc = [[UINavigationController alloc]initWithRootViewController:lvc];
    
    ViewController *hvc = [[ViewController alloc]init];
    UINavigationController *hnvc = [[UINavigationController alloc]initWithRootViewController:hvc];
    
    
    [tabBars addObject:fnvc];
    [tabBars addObject:cnvc];
    [tabBars addObject:loanNv];
    [tabBars addObject:lnvc];
    [tabBars addObject:hnvc];

    
    self.viewControllers = tabBars;
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    
    for(UIView *view in bottomMenuView.subviews){
        
        [view removeFromSuperview];
    }
    [bottomMenuView removeFromSuperview];
    
    NSMutableArray * bottomButtonRects = [[NSMutableArray alloc]init];
    
    bottomMenuView = [[UIView alloc] initWithFrame:CGRectMake(0,([[UIScreen mainScreen] bounds].size.height-TabButtonHeight), self.view.frame.size.width, TabButtonHeight)];
    
    UIImageView *ima = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, TabButtonHeight)];
//    ima.image = IMAGE(@"tabbar背景");
    ima.image = [UIImage imageNamed:@"tabbar背景"];

    [bottomMenuView addSubview:ima];
    
    
    bottomMenuView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bottomMenuView];
    
    
    for (int i=0; i<5; i++) {
        float Q =  ((ScreenWidth/5-TabButtonWidth)/2);
        [bottomButtonRects addObject:NSStringFromCGRect(CGRectMake(Q+i*ScreenWidth/5,0, TabButtonWidth, TabButtonHeight))];
        
    }
    for (int i = 0; i < 5; i++)
    {
        UIButton *menuImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        menuImageButton.frame =CGRectFromString([bottomButtonRects objectAtIndex:i]);
        menuImageButton.tag = i;
        menuImageButton.adjustsImageWhenHighlighted = NO;
        [self setButtonImage:menuImageButton];
        [menuImageButton addTarget:self action:@selector(bottomButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonArray addObject:menuImageButton];
        [bottomMenuView addSubview:menuImageButton];
    }
    [self refrashBottomButton];
    
}


- (void)setButtonImage:(UIButton *) sender{
    UIImage *backImage = nil;
    UIImage *selectedBackImage = nil;
    backImage =[UIImage imageNamed:@"tab_icon01"];
    selectedBackImage = [UIImage imageNamed:@"tab_icon01_a"];
//    if(sender.tag == 0){
//
//        backImage = IMAGE(@"tab_icon01");
//        selectedBackImage = IMAGE(@"tab_icon01_a");
//
//    }else if (sender.tag == 1 ){
//
//        backImage = IMAGE(@"tab_icon02");
//        selectedBackImage = IMAGE(@"tab_icon02_a");
//
//    }else if (sender.tag == 2){
//
//        backImage = IMAGE(@"tab_iconloan");
//        selectedBackImage = IMAGE(@"tab_iconloan_a");
//
//
//    }else if (sender.tag == 3){
//
//        backImage = IMAGE(@"tab_icon03");
//        selectedBackImage = IMAGE(@"tab_icon03_a");
//
//    }else{
//
//        backImage = IMAGE(@"tab_icon04");
//        selectedBackImage = IMAGE(@"tab_icon04_a");
//
//    }
    [sender setBackgroundImage:backImage forState:UIControlStateNormal];
    [sender setBackgroundImage:selectedBackImage forState:UIControlStateSelected];
}

- (void)bottomButtonAction:(UIButton *)sender{
//    if (sender.tag == 4) {
//
//        if (!Context.isLoginFlag) {
//
//            if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"isGestureFlag"] isEqualToString:@"YES"]||[[[NSUserDefaults standardUserDefaults] objectForKey:@"isFingerFlag"] isEqualToString:@"YES"]) {
//                TableBarHidden
//                [Context.rootNavViewController setNavigationBarHidden:NO];
//                //验证手势
//                [CPUtility registerHandler:@"Gesture_Verify" withObject:Context.rootNavViewController withData:nil];
//
//            }else{
//
//                [[GPFsliderViewController sharedSliderController] showRightViewController];
//
//            }
//
//            //            [[GPFsliderViewController sharedSliderController] showRightViewController];
//
//        }else{
//
//            for (UIButton *tempBtn in _buttonArray) {
//                tempBtn.selected = NO;
//            }
//
//            self.selectedIndex = sender.tag;
//            sender.selected = YES;
//
//
//        }
//    }else{
//
//        for (UIButton *tempBtn in _buttonArray) {
//            tempBtn.selected = NO;
//        }
//        sender.selected = YES;
//        self.selectedIndex = sender.tag;
//
//
//    }
}

- (void)refrashBottomButton{
    for (UIButton *tempBtn in _buttonArray) {
        tempBtn.selected = NO;
    }
    UIButton *btn = (UIButton *)[_buttonArray objectAtIndex:self.selectedIndex];
    btn.selected = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideTheTabbar
{
    bottomMenuView.hidden = YES;
    
    self.tabBar.alpha = .0;
    
    self.tabBar.frame = CGRectMake(0, 0, 0, 0);
    
    self.tabBar.hidden = YES;
}

- (void)showTheTabbar
{
    self.tabBar.hidden = NO;
    bottomMenuView.hidden = NO;
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
