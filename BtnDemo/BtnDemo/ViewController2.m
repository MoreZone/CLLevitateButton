//
//  ViewController2.m
//  BtnDemo
//
//  Created by More on 16/11/24.
//  Copyright © 2016年 More. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,assign)NSInteger a;

@end

@implementation ViewController2

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title =@"全屏悬浮";
    self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn.frame = CGRectMake(10, 100, 50, 50);
    
    [self.btn setTitle:@"触摸" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(dragMoving:withEvent: )forControlEvents: UIControlEventTouchDragInside];
    [self.btn addTarget:self action:@selector(doClick:) forControlEvents:UIControlEventTouchUpInside];
    self.a=0;
    [self.view addSubview:self.btn];
}
-(void)doClick:(UIButton*)sender
{
    if (self.a==0)
    {
        NSLog(@"1111");
    }
    self.a=0;
}

- (void) dragMoving: (UIButton *) c withEvent:ev
{
    self.a=1;
    c.center = [[[ev allTouches] anyObject] locationInView:self.view];
    NSLog(@"%f,,,%f",c.center.x,c.center.y);
}
@end
