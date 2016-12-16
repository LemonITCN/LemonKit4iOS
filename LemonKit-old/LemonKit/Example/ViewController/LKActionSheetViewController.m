//
//  LKActionSheetViewController.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/9/20.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "LKActionSheetViewController.h"


@interface LKActionSheetViewController ()<UIPickerViewDataSource , UIPickerViewDelegate>

@end

@implementation LKActionSheetViewController{
    NSArray *_source;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)showBasicActionSheet:(UIButton *)sender {
    LKActionSheetView *as = [LKActionSheetView defaultActionSheetView];
    [as clear];
    as.headViewHeight = 44;
    as.title = @"这是一个普通的LKActionSheet";
    LKActionItem *cancel = [[LKActionItem alloc] initWithTitle: @"取消" onTouchBlock:^(LKActionItem *item) {
        [as hide];
    }];
    ((UILabel *)cancel.contentView).textColor = [UIColor redColor];
    [as addAction: cancel groupIndex: 0];
    [as addActionGroup];
    as.backViewControllerScale = 1;// 设置1 就没有后边viewController的缩放效果了
    [as addAction: [[LKActionItem alloc] initWithTitle: @"哈哈哈" onTouchBlock: nil] groupIndex: 1];
    [as addAction: [[LKActionItem alloc] initWithTitle: @"当然啦" onTouchBlock: nil] groupIndex: 1];
    [as show];
}
- (IBAction)showPickerActionSheet:(UIButton *)sender {
    self->_source = @[@"中山区" , @"西岗区" , @"高新园区" , @"甘井子区" , @"旅顺口区" , @"瓦房店" , @"金州" , @"普兰店"];
    LKActionSheetView *as = [LKActionSheetView defaultActionSheetView];
    [as clear];
    as.headViewHeight = 44;
    as.title = @"这是一个带有PickerView的LKActionSheet";
    LKActionItem *cancel = [[LKActionItem alloc] initWithTitle: @"取消" onTouchBlock:^(LKActionItem *item) {
        [as hide];
    }];
    ((UILabel *)cancel.contentView).textColor = [UIColor redColor];
    [as addAction: cancel groupIndex: 0];
    [as addAction: [[LKActionItem alloc] initWithTitle: @"确认" onTouchBlock:^(LKActionItem *item) {
        NSLog(@"您点击了确定");
    }] groupIndex: 0];
    
    [as addActionGroup];
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame: CGRectMake(0, 0, LKScreenGetWidth, 160)];
    picker.dataSource = self;
    picker.delegate = self;
    [as addAction: [[LKActionItem alloc] initWithCustomView: picker height: 160 onTouchBlock: nil] groupIndex: 1];
    
    [as show];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self->_source.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self->_source[row];
}

@end
