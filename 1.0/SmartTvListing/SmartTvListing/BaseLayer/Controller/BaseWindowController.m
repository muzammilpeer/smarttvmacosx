//
//  BaseWindowController.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "BaseWindowController.h"
#import "AppDelegate.h"

@interface BaseWindowController ()

@end

@implementation BaseWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    
}
- (void)awakeFromNib
{
    // To specify we want our given window to be the full screen primary one, we can
    // use the following:
    //      [self.window setCollectionBehavior:NSWindowCollectionBehaviorFullScreenPrimary];
    //
    // But since we have already set this in our xib file for our NSWindow object
    //  (Full Screen -> Primary Window) this line of code it not needed.
    
    // listen for these notifications so we can update our image based on the full-screen state
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(willEnterFull:)
//                                                 name:NSWindowWillEnterFullScreenNotification
//                                               object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(didExitFull:)
//                                                 name:NSWindowDidExitFullScreenNotification
//                                               object:nil];
}
//
//- (void)didExitFull:(NSNotification *)notif
//{
//    // our window "exited" full screen mode
//    NSLog(@"didExitFull");
//    AppDelegate *appDelegate = (AppDelegate *)[NSApp delegate];
//    CGRect screenRect = CGRectMake(0, 0, 800, 622);
//
//    [appDelegate.mainWindowController.window setFrame:screenRect display:YES];
//
////    NSViewController *topController = [appDelegate.mainWindowController.rootViewController.viewControllerStack lastObject];
//    NSViewController *topController = [appDelegate.mainWindowController contentViewController];
//    topController.view.frame = screenRect;
//}
//
//// -------------------------------------------------------------------------------
////  willEnterFull:notif
//// -------------------------------------------------------------------------------
//- (void)willEnterFull:(NSNotification *)notif
//{
//    // our window "entered" full screen mode
//    NSLog(@"willEnterFull");
//    CGRect screenRect = [[NSScreen mainScreen] frame];
//    AppDelegate *appDelegate = (AppDelegate *)[NSApp delegate];
//    [appDelegate.mainWindowController.window setFrame:screenRect display:YES];
////    NSViewController *topController = [appDelegate.mainWindowController.rootViewController.viewControllerStack lastObject];
//    NSViewController *topController = [appDelegate.mainWindowController contentViewController];
//    topController.view.frame = screenRect;
//}

@end
