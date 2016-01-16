//
//  RequestProtocol.h
//  Communique
//
//  Created by Hussain Mansoor on 7/13/14.
//  Copyright (c) 2014 Foomo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol RequestProtocol <NSObject>

@required
- (NSString *) url;

- (BOOL) haveGetData;
- (NSDictionary *) getData;

- (BOOL) havePostData;
- (NSData *) postData;

@end
