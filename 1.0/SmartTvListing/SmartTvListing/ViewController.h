//
//  ViewController.h
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright (c) 2016 Muzammil Peer. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVKit/AVPlayerView.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet AVPlayerView *avPlayer;

@end

