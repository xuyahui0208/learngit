//
//  FirstCell.m
//  FirstProject
//
//  Created by 徐亚辉 on 2017/10/27.
//  Copyright © 2017年 XH. All rights reserved.
//

#import "FirstCell.h"
#import <Masonry/Masonry.h>
@implementation FirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel * textLabel = [[UILabel alloc]init];
        self.textLabel = textLabel;
        [self.contentView addSubview:textLabel];
        
    }
    return self;
}
-(void)layoutSubviews{
    [self.textLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(20);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(10);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
