//
//  UIDragButton.h
//  BtnDemo
//
//  Created by More on 16/11/24.
//  Copyright © 2016年 More. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol UIDragButtonDelegate <NSObject>

-(void)dragButtonClicked:(UIButton*)sender;

@end

@interface UIDragButton : UIButton

/**
 *  悬浮窗所依赖的根视图
 */
@property(nonatomic,strong)UIView *rootView;

/**
 *  UIDragButton的点击事件代理
 */
@property(nonatomic,weak)id<UIDragButtonDelegate>btnDelegate;

@end
