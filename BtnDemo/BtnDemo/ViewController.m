//
//  ViewController.m
//  BtnDemo
//
//  Created by More on 16/11/24.
//  Copyright © 2016年 More. All rights reserved.
//

#import "ViewController.h"
#import "FloatingViewController.h"
@interface ViewController ()

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self makeN:@"0"];

}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    NSLog(@"------");
    
}

-(void)makeBTN{
    
    FloatingViewController *floatVC =[[FloatingViewController alloc]init];
    [self addChildViewController:floatVC];
    [self.view addSubview:floatVC.view];
}

-(void)makeN:(NSString *)nsstring
{
    if ([nsstring isEqualToString:@"0"]) {
        
        [self makeBTN];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
