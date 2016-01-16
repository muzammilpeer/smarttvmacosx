//
//  LoginViewController.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "LiveChannelsListViewController.h"
#import "NSNavigationController.h"

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   

}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}


- (IBAction)actionSignInClick:(id)sender {
    
    LiveChannelsListViewController *controller = GetStoryBoardAccordingToModule(@"Main", @"LiveChannelsListViewController");
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)actionSignUpClick:(id)sender {
}
@end
