//
//  StringsManagerUtil.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/17/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "StringsManagerUtil.h"

@implementation StringsManagerUtil


+(NSString*)mergeString:(NSString*)stringOne withStringTwo:(NSString*)stringTwo
{
    return [NSString stringWithFormat:@"%@%@",stringOne,stringTwo];
}

+(NSArray*)stringSplitedBy:(NSString*)mainString seperatedBy:(NSString*)seperator
{
    return [mainString componentsSeparatedByString:seperator];
}

@end
