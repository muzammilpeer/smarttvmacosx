//
//  AppDelegate.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright (c) 2016 Muzammil Peer. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    //launch window now
    self.mainWindowController = GetStoryBoardAccordingToModule(@"Main", @"MainWindowController");
    [self.mainWindowController showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}




- (IBAction)actionUserProfile:(id)sender {
}

- (IBAction)actionUnSubscribe:(id)sender {
}

- (IBAction)actionLogout:(id)sender {
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
