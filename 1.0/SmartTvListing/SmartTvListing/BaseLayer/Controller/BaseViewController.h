//
//  BaseViewController.h
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ResponseProtocol.h"

@class NSNavigationController;

@interface BaseViewController : NSViewController<ResponseProtocol>

@property (nonatomic, weak) NSNavigationController *navigationController;

@end
