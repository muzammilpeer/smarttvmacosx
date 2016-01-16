//
//  ViewController.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright (c) 2016 Muzammil Peer. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:@"http://pitelevision.com:1935/pitelevision/ptvsportsnew3/playlist.m3u8?token=pb860c69n5t228fs"];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
//                  [playerItem addObserver:self forKeyPath:@"status" options:0 context:&ItemStatusContext];
    [self.avPlayer setPlayer:[AVPlayer playerWithPlayerItem:playerItem]];
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
