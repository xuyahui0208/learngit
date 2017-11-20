//
//  FirstCell.h
//  FirstProject
//
//  Created by 徐亚辉 on 2017/10/27.
//  Copyright © 2017年 XH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstModel.h"
@interface FirstCell : UITableViewCell
@property (nonatomic,weak)UILabel * textLabel;
@property (nonatomic, weak)FirstModel * model;
@end
