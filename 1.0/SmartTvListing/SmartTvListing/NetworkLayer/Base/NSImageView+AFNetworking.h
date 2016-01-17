//
//  NSImageView+AFNetworking.h
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/17/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImageView (AFNetworking)

- (void)setImageFromURL:(NSURL *)url;
- (void)setImageFromURL:(NSURL *)url withThumbnailURL:(NSURL *)thumbnail;
- (void)setImageFromURL:(NSURL *)url withThumbnail:(NSImage *)thumbnail;
@end
