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

@property (nonatomic) NSInteger requestType;
@property (nonatomic, strong) id localData;

- (NSString *) url;

- (BOOL) haveGetData;
- (NSDictionary *) getData;

- (BOOL) havePostData;
- (NSDictionary *) postData;

- (BOOL) haveImageData;
- (NSImage*) imageData;

@end
