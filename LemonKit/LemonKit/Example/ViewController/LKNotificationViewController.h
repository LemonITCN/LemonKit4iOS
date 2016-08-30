//
//  LKNotificationViewController.h
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/29.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LemonKit.h"

@interface LKNotificationViewController : UIViewController <LKNotificationDelegate>

- (IBAction)showBasicNotification:(UIButton *)sender;

@end
