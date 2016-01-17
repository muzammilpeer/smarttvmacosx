//
//  NSNavigationController.h
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class BaseViewController;

@interface NSNavigationController : NSResponder

@property (nonatomic, strong) NSMutableArray *viewControllerStack;

@property (nonatomic, strong) BaseViewController *rootViewController;

- (id)initWithRootViewController:(BaseViewController *)rootViewController;
- (NSView*)view;

- (void)pushViewController:(BaseViewController *)viewController animated:(BOOL)animated;
- (BaseViewController *)popToRootViewControllerAnimated:(BOOL)animated;

- (BaseViewController *)popViewControllerAnimated:(BOOL)animated;

@end
