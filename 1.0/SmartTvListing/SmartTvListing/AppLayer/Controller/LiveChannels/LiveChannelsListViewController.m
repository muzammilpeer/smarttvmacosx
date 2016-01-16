//
//  LiveChannelsListViewController.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "LiveChannelsListViewController.h"

@interface LiveChannelsListViewController ()

@end

@implementation LiveChannelsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (IBAction)actionBackPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    NSLog(@"NavigationStackCount = %lu",[self.navigationController.viewControllerStack count]);
}

@end
