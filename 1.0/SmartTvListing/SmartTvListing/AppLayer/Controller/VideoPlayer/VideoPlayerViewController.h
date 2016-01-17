//
//  VideoPlayerViewController.h
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/17/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "BaseViewController.h"

#import <AVKit/AVPlayerView.h>
#import <AVFoundation/AVFoundation.h>


@interface VideoPlayerViewController : BaseViewController

@property (weak) IBOutlet AVPlayerView *avPlayer;

@end
