//
//  BaseViewController.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}


#pragma mark - ResponseProtocol

- (void)responseWithError:(NSError *)error andRequestType:(NSInteger)requestType
{
    NSLog(@"responseWithError = %@", [error description]);
}

- (void)successWithData:(id)data andRequestType:(NSInteger)requestType
{
    NSLog(@"successWithData = %@", data);
}


@end
