//
//  NetworkManager.h
//  Communique
//
//  Created by Hussain Mansoor on 7/2/14.
//  Copyright (c) 2014 Foomo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RequestProtocol.h"

@interface BaseNetworkRequest : NSObject <RequestProtocol>

//public contructor
- (instancetype)initWithModel: (id) model withRequestType:(NSInteger) requestType;

- (NSInteger) getRequestType;
- (id) getLocalData;

- (NSString *) url;

- (BOOL) haveGetData;
- (NSDictionary *) getData;

- (BOOL) havePostData;
- (NSDictionary *) postData;

- (BOOL) haveImageData;
- (NSImage*) imageData;

@end
