//
//  UserManager.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/17/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager


+(BOOL)isUserLoggedIn
{
    if ([DefaultsManagerUtil getUserDefaults:kDefaultKeyUserDetail] != nil) {
        return YES;
    }
    return NO;
}

+(NSString*)getLoggedInToken
{
    if ([DefaultsManagerUtil getUserDefaults:kDefaultKeyUserDetail] != nil) {
       LoginResponseModel *userDetail =   (LoginResponseModel*)[DefaultsManagerUtil getUserDefaults:kDefaultKeyUserDetail];
        return userDetail.data.response.token;
    }
    return @"";
}

+(NSString*)getMergedLoggedInTokenID
{
    if ([DefaultsManagerUtil getUserDefaults:kDefaultKeyUserDetail] != nil) {
        LoginResponseModel *userDetail =   (LoginResponseModel*)[DefaultsManagerUtil getUserDefaults:kDefaultKeyUserDetail];
        return MERGE_STRING(@"token=",userDetail.data.response.token);
    }
    return @"";
}


+(LoginData*)getLoggedInUserDetail
{
    if ([DefaultsManagerUtil getUserDefaults:kDefaultKeyUserDetail] != nil) {
        LoginResponseModel *userDetail =   (LoginResponseModel*)[DefaultsManagerUtil getUserDefaults:kDefaultKeyUserDetail];
        return userDetail.data;
    }
    return nil;
}

@end
