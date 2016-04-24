//
//  ViewController.m
//  SaberSquareDemo
//
//  Created by songlong on 16/4/11.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import "ViewController.h"
#import "SLMainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)clickButton {
    SLMainViewController *VC = [[SLMainViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
