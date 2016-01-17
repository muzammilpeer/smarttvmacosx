//
//  DefaultsManager.h
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/17/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DefaultsManagerUtil : NSObject
{
    
}

//user defaults

+ (NSObject *)getUserDefaults:(NSString *)key;
+ (void)setUserDefaults:(NSObject *)object key:(NSString *)key;


@end
