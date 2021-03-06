//
//  TwoFactorCloseViewController.m
//  CodingMart
//
//  Created by Ease on 16/2/22.
//  Copyright © 2016年 net.coding. All rights reserved.
//

#import "TwoFactorCloseViewController.h"
#import "TableViewFooterButton.h"
#import "PhoneCodeButton.h"
#import "Coding_NetAPIManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "CountryCodeListViewController.h"

@interface TwoFactorCloseViewController ()
@property (weak, nonatomic) IBOutlet TableViewFooterButton *footerBtn;
@property (weak, nonatomic) IBOutlet UITextField *mobileF;
@property (weak, nonatomic) IBOutlet UITextField *verify_codeF;
@property (weak, nonatomic) IBOutlet PhoneCodeButton *verify_codeBtn;

@property (weak, nonatomic) IBOutlet UILabel *countryCodeL;
@property (strong, nonatomic) NSDictionary *countryCodeDict;

@end

@implementation TwoFactorCloseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.countryCodeDict = @{@"country": @"China",
                             @"country_code": @"86",
                             @"iso_code": @"cn"};

    RAC(self, footerBtn.enabled) = [RACSignal combineLatest:@[self.mobileF.rac_textSignal, self.verify_codeF.rac_textSignal] reduce:^id(NSString *mobile, NSString *verify_code){
        return @(mobile.length > 0 && verify_code.length > 0);
    }];
}

- (void)setCountryCodeDict:(NSDictionary *)countryCodeDict{
    _countryCodeDict = countryCodeDict;
    _countryCodeL.text = [NSString stringWithFormat:@"+%@", _countryCodeDict[@"country_code"]];
}

#pragma mark - Button
- (IBAction)countryCodeBtnClicked:(id)sender {
    CountryCodeListViewController *vc = [CountryCodeListViewController storyboardVC];
    WEAKSELF;
    vc.selectedBlock = ^(NSDictionary *countryCodeDict){
        weakSelf.countryCodeDict = countryCodeDict;
    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)verify_codeBtnClicked:(id)sender {
    if (_mobileF.text.length <= 0) {
        [NSObject showHudTipStr:@"请填写手机号码"];
        return;
    }
    _verify_codeBtn.enabled = NO;
//    [[Coding_NetAPIManager sharedManager] post_Close2FAGeneratePhoneCode:_mobileF.text block:^(id data, NSError *error) {
//        if (data) {
//            [NSObject showHudTipStr:@"验证码发送成功"];
//            [self.verify_codeBtn startUpTimer];
//        }else{
//            self.verify_codeBtn.enabled = YES;
//        }
//    }];
}
- (IBAction)footerBtnClicked:(id)sender {
    [NSObject showHUDQueryStr:@"正在关闭两步验证..."];
//    [[Coding_NetAPIManager sharedManager] post_Close2FAWithPhone:_mobileF.text code:_verify_codeF.text block:^(id data, NSError *error) {
//        [NSObject hideHUDQuery];
//        if (data) {
//            [NSObject showHudTipStr:@"两步验证已关闭"];
//            [self.navigationController popToRootViewControllerAnimated:YES];
//        }
//    }];
}

@end
