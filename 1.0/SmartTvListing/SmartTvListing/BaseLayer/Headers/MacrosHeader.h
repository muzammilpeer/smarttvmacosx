//
//  MacrosHeader.h
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#ifndef MacrosHeader_h
#define MacrosHeader_h
#import "StringsManagerUtil.h"

#define GetStoryBoardAccordingToModule(modulename,screenname) [StoryBoardUtil StoryBoardAccordingToModule:modulename withScreen:screenname]


#define readDefaults(a) [DefaultsManagerUtil getUserDefaults:a]
#define saveDefaults(value,key) [DefaultsManagerUtil setUserDefaults:value key:key]

#define MERGE_STRING(a,b) [StringsManagerUtil mergeString:a withStringTwo:b]
#define SPLIT_STRING(string,seperator) [StringsManagerUtil stringSplitedBy:string seperatedBy:seperator]

#endif /* MacrosHeader_h */
