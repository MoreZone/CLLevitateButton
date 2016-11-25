//
//  FloatingViewController.m
//  BtnDemo
//
//  Created by More on 16/11/24.
//  Copyright © 2016年 More. All rights reserved.
//
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ScreenW [UIScreen mainScreen].bounds.size.width

#define floatSize 40
#import "FloatingViewController.h"
#import "UIDragButton.h"
#import "FloatWindow.h"
#import "ViewController2.h"

@interface FloatingViewController ()<UIDragButtonDelegate>

@property(strong,nonatomic)FloatWindow *window;
@property(strong,nonatomic)UIDragButton *button;

@end

@implementation FloatingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.frame =CGRectZero;
    [self performSelector:@selector(createButton) withObject:nil afterDelay:1];

}

/**
 *  创建悬浮窗口
 */
- (void)createButton
{
    // 悬浮按钮
    _button = [UIDragButton buttonWithType:UIButtonTypeCustom];
    [_button setImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateNormal];
    // 按钮图片伸缩充满整个按钮
    _button.imageView.contentMode = UIViewContentModeScaleToFill;
    _button.frame = CGRectMake(0, 0, floatSize, floatSize);
    // 按钮点击事件
    [_button addTarget:self action:@selector(floatBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    // 初始选中状态
    _button.selected = NO;
    // 禁止高亮
    _button.adjustsImageWhenHighlighted = NO;
    _button.rootView = self.view.superview;
    _button.btnDelegate = self;
    _button.imageView.alpha = 0.8;
    
    // 悬浮窗
    _window = [[FloatWindow alloc]init];
    _window.floatFrame = CGRectMake(ScreenW-floatSize, ScreenH-49, floatSize, floatSize);
    _window.windowLevel = UIWindowLevelAlert+1;
    _window.backgroundColor = [UIColor clearColor];
    _window.layer.cornerRadius = floatSize/2;
    _window.layer.masksToBounds = YES;
    // 将按钮添加到悬浮按钮上
    [_window addSubview:_button];
    //显示window
    [_window makeKeyAndVisible];
}

-(void)makeBtn{
    NSLog(@"1");
}
/**
 *  悬浮按钮点击
 */
- (void)floatBtnClicked:(UIButton *)sender
{
    NSLog(@"------");
    
    // 按钮选中关闭切换
    sender.selected = !sender.selected;
    if (sender.selected) {
        
        NSLog(@"点击----");
        [sender setImage:[UIImage imageNamed:@"add_rotate"] forState:UIControlStateNormal];
    }else{
        [sender setImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateNormal];
    }
    // 关闭悬浮窗
//    [_window resignKeyWindow];
//    _window = nil;
    
}

- (void)dragButtonClicked:(UIButton *)sender {
    
    NSLog(@"-----");
    ViewController2 *vc =[[ViewController2 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    // 按钮选中关闭切换
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setImage:[UIImage imageNamed:@"add_rotate"] forState:UIControlStateNormal];
    }else{
        [sender setImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
