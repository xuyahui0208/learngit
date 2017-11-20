
//
//  FirstModel.m
//  FirstProject
//
//  Created by 徐亚辉 on 2017/10/27.
//  Copyright © 2017年 XH. All rights reserved.
//

#import "FirstModel.h"

@implementation FirstModel
-(instancetype)init{
    self = [super init];
    if (self)
    {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    return self;
    
}
@end
