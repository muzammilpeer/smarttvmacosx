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


#define SHOW_PROGRESS_LOADER(message) [[ProcessIndicator sharedInstance] showProcessIndicatorInView:PROCESS_INDICATOR_MSG]
#define HIDE_PROGRESS_LOADER() [[ProcessIndicator sharedInstance] hideProcessIndicator]

#define RGBA(r, g, b,a) [NSColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#endif /* MacrosHeader_h */
