//
//  AppDelegate.h
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright (c) 2016 Muzammil Peer. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainWindowController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) MainWindowController *mainWindowController;

@property (strong, nonatomic) NSWindow *window;


//User
- (IBAction)actionUserProfile:(id)sender;
- (IBAction)actionUnSubscribe:(id)sender;
- (IBAction)actionLogout:(id)sender;

//Shows
- (IBAction)actionLiveChannels:(id)sender;
- (IBAction)actionVideoOnDemand:(id)sender;
- (IBAction)actionEducation:(id)sender;

//My Library
- (IBAction)actionMyFavourites:(id)sender;
- (IBAction)actionMyRecordedShows:(id)sender;
- (IBAction)actionDownloads:(id)sender;


//Schedule
- (IBAction)actionScheduleCartoonNetwork:(id)sender;


@end

