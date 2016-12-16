//
//  TipsViewController.m
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/29.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "TipsViewController.h"

@implementation TipsViewController{
    NSArray<NSString *> *_titleArray;
    NSArray<NSString *> *_viewControllerIDArray;
    UIStoryboard *_tipStoryBoard;
}

- (void)viewDidLoad{
    self->_titleArray = @[@"LKNotification" , @"LKBubble" , @"LKActionSheet"];
    self->_viewControllerIDArray = @[@"LKNotificationViewController" , @"LKBubbleViewController" , @"LKActionSheetViewController"];
    self->_tipStoryBoard = [UIStoryboard storyboardWithName: @"Tips" bundle: nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self->_viewControllerIDArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CUSTOM_VIEW_CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: identifier];
    }
    cell.textLabel.text = self->_titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController: [self->_tipStoryBoard instantiateViewControllerWithIdentifier: _viewControllerIDArray[indexPath.row]] animated: YES];
}


@end
