//
//  ViewController.m
//  Example
//
//  Created by MacBook Air on 16/7/26.
//  Copyright © 2016年 ellmcz. All rights reserved.
//

#import "ViewController.h"
#import "TableController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)done:(UIButton *)sender {
    NSUInteger tag=sender.tag;
    TableController *tableController=[[TableController alloc]init];
    tableController.flag=tag;
    [self.navigationController pushViewController:tableController animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
