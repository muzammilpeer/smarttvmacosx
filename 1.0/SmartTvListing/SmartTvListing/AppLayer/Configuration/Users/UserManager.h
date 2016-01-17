//
//  UserManager.h
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/17/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "LoginResponseModel.h"
#import "LoginData.h"
#import "LoginResponse.h"

@interface UserManager : NSObject

+(BOOL)isUserLoggedIn;
+(NSString*)getLoggedInToken;
+(NSString*)getMergedLoggedInTokenID;

+(LoginData*)getLoggedInUserDetail;


@end
