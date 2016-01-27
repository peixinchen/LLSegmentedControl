//
//  ViewController.m
//  LLSegmentControlDemo
//
//  Created by LiLiang on 16/1/26.
//  Copyright © 2016年 LiLiang. All rights reserved.
//

#import "ViewController.h"
#import "LLSegmentControl.h"

@interface ViewController ()

@property (nonatomic, weak) LLSegmentControl  *segmentCtl;
@property (nonatomic, strong) UIView *  cview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.87 green:0.19 blue:0.19 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    
//    self.cview = [UIView new];
//    self.cview.frame = CGRectMake(0, 100, 400, 300);
//    self.cview.backgroundColor = [UIColor colorWithRed:0.87 green:0.19 blue:0.19 alpha:1];;
//    [self.view addSubview:self.cview];
    
    LLSegmentControl *segmentCtl = [[LLSegmentControl alloc] initWithFrame:CGRectMake(0, 0, 195, 28) items:@[@"直播", @"房间"]];
    
//    [self.cview addSubview:segmentCtl];
    
    
    self.navigationItem.titleView = segmentCtl;
    self.segmentCtl = segmentCtl;
     
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.segmentCtl.frame = CGRectMake(0, 0, 195, 28);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
