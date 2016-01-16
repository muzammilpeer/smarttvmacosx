//
//  NetworkFactory.h
//  Communique
//
//  Created by Hussain Mansoor on 7/2/14.
//  Copyright (c) 2014 Foomo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BaseNetworkRequest.h"
#import "ResponseProtocol.h"

@interface NetworkManager : NSObject

+ (NetworkManager *) sharedInstance;

- (void) executeRequest:(BaseNetworkRequest *)request withDelegate:(id<ResponseProtocol>)delegate requestType:(NSInteger)requestType;

@end
