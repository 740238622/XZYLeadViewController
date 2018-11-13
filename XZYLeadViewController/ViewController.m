//
//  ViewController.m
//  XZYLeadViewController
//
//  Created by 徐自由 on 2017/12/20.
//  Copyright © 2017年 徐自由. All rights reserved.
//

#import "ViewController.h"
#import "XZYLeadScrollView.h"

@interface ViewController () <XZYLeadScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    XZYLeadScrollView *leadScr = [[XZYLeadScrollView alloc] initLeadScrollViewWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) dataArray:@[@"",@"",@"",@""] delegate:self];
    
    [self.view addSubview:leadScr];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LeadScrollViewDelegate

- (void)leadScrollViewActGoToMain
{
//    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:true] forKey:@"firstRun"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//
//    [[AppDelegate sharedAppDelegate] startFirstRun];
}

@end
