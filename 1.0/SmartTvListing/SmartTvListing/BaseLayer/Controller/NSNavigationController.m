//
//  NSNavigationController.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "NSNavigationController.h"

#import "NSNavigationController.h"
#import "AppDelegate.h"
#import "BaseViewController.h"

@interface NSNavigationController ()


@end

@implementation NSNavigationController
- (id)initWithRootViewController:(BaseViewController *)rootViewController
{
    self = [super init];
    if (self) {
        self.rootViewController = rootViewController;
        self.rootViewController.navigationController = self;
        self.viewControllerStack = [[NSMutableArray alloc] initWithObjects:self.rootViewController, nil];
    }
    return self;
}

- (NSView*)view
{
    BaseViewController *topViewController = [self.viewControllerStack objectAtIndex:[self.viewControllerStack count] - 1];
    return topViewController.view;
}

- (void)pushViewController:(BaseViewController *)viewController animated:(BOOL)animated
{
    if (viewController != nil) {
        [self removeTopView];
        [self.viewControllerStack addObject:viewController];
        viewController.navigationController = self;
        [self addTopView];
    }
}

- (BaseViewController *)popToRootViewControllerAnimated:(BOOL)animated
{
    BaseViewController *topViewController = [self.viewControllerStack objectAtIndex:[self.viewControllerStack count] - 1];
    [self removeTopView];
    [self.viewControllerStack removeLastObject];
    [self addTopView];
    
    return topViewController;
}

- (BaseViewController *)popViewControllerAnimated:(BOOL)animated
{
    BaseViewController *topViewController = [self.viewControllerStack objectAtIndex:[self.viewControllerStack count] - 1];
    [self removeTopView];
    [self.viewControllerStack removeLastObject];
    [self addTopView];
    
    return topViewController;
}

- (void)removeTopView
{
    BaseViewController *topViewController = [self.viewControllerStack objectAtIndex:[self.viewControllerStack count] - 1];
    [topViewController.view removeFromSuperview];
}

- (void)addTopView
{
    BaseViewController *topViewController = [self.viewControllerStack objectAtIndex:[self.viewControllerStack count] - 1];
    AppDelegate *delegate = (AppDelegate*)[NSApp delegate];
//    [delegate.window.contentView addSubview:topViewController.view];
    delegate.mainWindowController.contentViewController = topViewController;
    
}
@end