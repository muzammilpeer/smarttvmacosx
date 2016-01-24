//
//  MainWindowController.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "MainWindowController.h"
#import "LoginViewController.h"
#import "LiveChannelsCategoriesViewController.h"
#import "AppDelegate.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    AppDelegate *appDelegate = (AppDelegate *)[NSApp delegate];
    appDelegate.mainWindowController = self;

    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    if ([UserManager isUserLoggedIn]) {
        LiveChannelsCategoriesViewController *controller = GetStoryBoardAccordingToModule(@"Main", @"LiveChannelsCategoriesViewController");
        self.rootViewController = [[NSNavigationController alloc] initWithRootViewController:controller];
    }else {
        LoginViewController *controller = GetStoryBoardAccordingToModule(@"Main", @"LoginViewController");
        self.rootViewController = [[NSNavigationController alloc] initWithRootViewController:controller];
        
    }

    self.window.contentViewController = self.rootViewController.rootViewController;
    
//    appDelegate.mainWindowController.window = self.window;

    
}

- (void)makeWindowControllers {
}

@end
