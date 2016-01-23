//
//  AppDelegate.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright (c) 2016 Muzammil Peer. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];

    
    //launch window now
    self.mainWindowController = GetStoryBoardAccordingToModule(@"Main", @"MainWindowController");
    [self.mainWindowController showWindow:self];
    

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (NSSize)windowWillResize:(NSWindow *)sender
                    toSize:(NSSize)frameSize
{
    return NSMakeSize(1024, 768);
}


- (IBAction)actionUserProfile:(id)sender {
}

- (IBAction)actionUnSubscribe:(id)sender {
}

- (IBAction)actionLogout:(id)sender {
    [DefaultsManagerUtil setUserDefaults:nil key:kDefaultKeyUserDetail];
    
    NSLog(@"NavigationStackCount = %lu",[self.mainWindowController.rootViewController.viewControllerStack count]);


    
    LoginViewController *controller = GetStoryBoardAccordingToModule(@"Main", @"LoginViewController");
    [self.mainWindowController.rootViewController pushViewController:controller animated:YES];

    if ([self.mainWindowController.rootViewController.viewControllerStack count] >=1) {
        [self.mainWindowController.rootViewController.viewControllerStack removeObjectAtIndex:0];
    }
}
- (IBAction)actionLiveChannels:(id)sender {
    
    
}

- (IBAction)actionVideoOnDemand:(id)sender {
}

- (IBAction)actionEducation:(id)sender {
}
- (IBAction)actionMyFavourites:(id)sender {
}

- (IBAction)actionMyRecordedShows:(id)sender {
}

- (IBAction)actionDownloads:(id)sender {
}
- (IBAction)actionScheduleCartoonNetwork:(id)sender {
}
@end
