//
//  ApplyCoderTopCell.m
//  CodingMart
//
//  Created by Ease on 2016/10/17.
//  Copyright © 2016年 net.coding. All rights reserved.
//

#import "ApplyCoderTopCell.h"
#import "UIImageView+WebCache.h"

@interface ApplyCoderTopCell ()
@property (weak, nonatomic) IBOutlet UIImageView *coderIcon;
@property (weak, nonatomic) IBOutlet UILabel *coderName;
@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (weak, nonatomic) IBOutlet UIImageView *statusV;
@property (weak, nonatomic) IBOutlet UIImageView *coderIdentityIcon;

@end

@implementation ApplyCoderTopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCurCoder:(RewardApplyCoder *)curCoder{
    _curCoder = curCoder;
    [_coderIcon sd_setImageWithURL:[_curCoder.avatar urlImageWithCodePathResize:60* 2]];
    _coderName.text = _curCoder.name;
    _timeL.text = [NSString stringWithFormat:@"报名时间：%@",  _curCoder.createdAt.length > 2? [_curCoder.createdAt substringToIndex:_curCoder.createdAt.length - 2]: @"--"];
    _statusV.image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_apply_status_%@", _curCoder.status]];

    NSString *iconName = nil;
    if (_curCoder.excellent.boolValue) {
        iconName = @"coder_icon_excellent";
    } else if (_curCoder.identityStatus.boolValue) {
        iconName = @"identity_passed";
    }
    _coderIdentityIcon.image = [UIImage imageNamed:iconName];
}

+ (CGFloat)cellHeight{
    return 90;
}
@end
