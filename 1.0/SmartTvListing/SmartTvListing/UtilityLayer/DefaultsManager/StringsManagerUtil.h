//
//  StringsManagerUtil.h
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/17/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringsManagerUtil : NSObject
+(NSString*)mergeString:(NSString*)stringOne withStringTwo:(NSString*)stringTwo;
+(NSArray*)stringSplitedBy:(NSString*)mainString seperatedBy:(NSString*)seperator;

@end
