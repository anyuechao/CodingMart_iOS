//
//  PublishRewardStep1ViewController.h
//  CodingMart
//
//  Created by Ease on 15/10/10.
//  Copyright © 2015年 net.coding. All rights reserved.
//

#import "EABaseTableViewController.h"
#import "Reward.h"

@interface PublishRewardStep1ViewController : EABaseTableViewController
@property (strong, nonatomic) Reward *rewardToBePublished;

+ (instancetype)storyboardVC;
@end
