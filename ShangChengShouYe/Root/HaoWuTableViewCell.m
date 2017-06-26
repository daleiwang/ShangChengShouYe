//
//  HaoWuTableViewCell.m
//  DMV1
//
//  Created by DaLei on 2017/6/22.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "HaoWuTableViewCell.h"

@implementation HaoWuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
