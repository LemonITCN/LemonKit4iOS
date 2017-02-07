//
//  LemonKit.m
//  LemonKit
//
//  Created by 1em0nsOft on 2016/11/24.
//  Copyright © 2016年 Lemonsoft. All rights reserved.
//

#import "LemonKit.h"

@implementation LemonKit{
    UIView *_lemonerContainer;
    UIButton *_lemoner;
}

static LemonKit *lemonKit;

+ (void)startUp{
    if (lemonKit == nil)
        lemonKit = [[[LemonKit alloc] init] startUp];
    printf("🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋\t🍋🍋🍋🍋🍋\n");
    printf("🍋🍋🍋🍋🍋 LemonKit Framework start up success!\t🍋🍋🍋🍋🍋\n");
    printf("🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋🍋\t🍋🍋🍋🍋🍋\n\n");

}

- (LemonKit *)startUp{
#ifdef DEBUG
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyWindowFirstKeyListener) name: UIWindowDidBecomeKeyNotification object: nil];
#else
    LKLog(@"APP startup!")
#endif
    return self;
}

- (void)initLemonView{
    // 创建工具箱控件容器
    self->_lemonerContainer = [[UIView alloc] initWithFrame: CGRectMake(0, 200, 50, 50)];
    self->_lemonerContainer.layer.cornerRadius = 10;
    self->_lemonerContainer.clipsToBounds = YES;
    [[UIApplication sharedApplication].keyWindow addSubview: self->_lemonerContainer];
    
    // 创建工具箱按钮
    self->_lemoner = [[UIButton alloc] initWithFrame: self->_lemonerContainer.bounds];
    [self->_lemoner setTitle: @"🍋" forState: UIControlStateNormal];
        [self->_lemoner.titleLabel setFont: [UIFont systemFontOfSize: 20]];
    self->_lemoner.backgroundColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.6];
    [self->_lemonerContainer addSubview: self->_lemoner];
}

-(void)keyWindowFirstKeyListener{
    [self initLemonView];
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}


@end
