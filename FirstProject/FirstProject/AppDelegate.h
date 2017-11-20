//
//  AppDelegate.h
//  FirstProject
//
//  Created by 徐亚辉 on 2017/10/23.
//  Copyright © 2017年 XH. All rights reserved.
//
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define tabbarHeight kDevice_Is_iPhoneX ? 83 : 49
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

