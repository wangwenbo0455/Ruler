//
//  ViewController.m
//  KeDuRuler
//
//  Created by 王文博 on 2017/8/26.
//  Copyright © 2017年 王文博. All rights reserved.
//

#import "ViewController.h"
#import "WBRulerVIew.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    WBRulerVIew * view = [[WBRulerVIew alloc]initWithFrame:CGRectMake(10, 200, self.view.bounds.size.width-20, 75)];
    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
