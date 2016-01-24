//
//  VideoPlayerViewController.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/17/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "VideoPlayerViewController.h"
#import "ChannelsData.h"

@interface VideoPlayerViewController ()
{
    ChannelsData *currentModel;
}

@property (weak) IBOutlet NSTextField *lScreenTitle;
@end

@implementation VideoPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    if ([self.sharedData isKindOfClass:[ChannelsData class]]) {
        currentModel = (ChannelsData*)self.sharedData;
        self.lScreenTitle.stringValue = currentModel.title;
        
        NSString *streamingURL = MERGE_STRING(currentModel.videoIosStreamUrlLow, [UserManager getMergedLoggedInTokenID]);
        streamingURL = [streamingURL stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
        NSURL *url = [NSURL URLWithString:streamingURL];
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
        //                  [playerItem addObserver:self forKeyPath:@"status" options:0 context:&ItemStatusContext];
        [self.avPlayer setPlayer:[AVPlayer playerWithPlayerItem:playerItem]];
    }
    
    
}

- (IBAction)actionBackPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"NavigationStackCount = %lu",[self.navigationController.viewControllerStack count]);
}

- (IBAction)actionStreamingQualitySelection:(id)sender {
    AVPlayerItem *playerItem;

    if ([sender state] == NSOnState) {
        NSString *streamingURL = MERGE_STRING(currentModel.videoIosStreamUrl, [UserManager getMergedLoggedInTokenID]);
        streamingURL = [streamingURL stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        NSURL *url = [NSURL URLWithString:streamingURL];
        playerItem = [AVPlayerItem playerItemWithURL:url];
    }
    else {
        NSString *streamingURL = MERGE_STRING(currentModel.videoIosStreamUrlLow, [UserManager getMergedLoggedInTokenID]);
        streamingURL = [streamingURL stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        NSURL *url = [NSURL URLWithString:streamingURL];
        playerItem = [AVPlayerItem playerItemWithURL:url];

    }
    [self.avPlayer setPlayer:[AVPlayer playerWithPlayerItem:playerItem]];
}
@end
