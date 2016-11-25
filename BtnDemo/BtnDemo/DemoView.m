//
//  DemoView.m
//  BtnDemo
//
//  Created by More on 16/11/25.
//  Copyright © 2016年 More. All rights reserved.
//

#import "DemoView.h"
#import "ViewController.h"
#import "ViewController2.h"

@interface DemoView ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tab ;
}

@property(nonatomic,strong)NSArray *nameArray;
@end

@implementation DemoView

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _nameArray =[[NSArray alloc]initWithObjects:@"吸附悬浮",@"全屏悬浮", nil];
    self.navigationItem.title =@"Demo";

    [self makeTab];
}
-(void)makeTab
{
    
    _tab =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tab.rowHeight =44;
    _tab.dataSource =self;
    _tab.delegate =self;
    [self.view addSubview:_tab];

}
#pragma  mark --------- 代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID =@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if ( cell ==nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.textLabel.text =_nameArray[indexPath.row];
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0) {
        ViewController *vc =[[ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row ==1)
    {
        ViewController2 *vc =[[ViewController2 alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
