//
//  StoryBoardUtil.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "StoryBoardUtil.h"

@implementation StoryBoardUtil


//return type is UIViewController by default
+(id) StoryBoardAccordingToModule:(NSString*) moduleName  withScreen:(NSString*)screenName
{
    NSViewController *controller = nil;
    @try {
        NSString *storyBoardName = moduleName;
        NSStoryboard *storyBoard = [NSStoryboard storyboardWithName:storyBoardName bundle: nil];
        if (nil != storyBoard) {
            controller = [storyBoard instantiateControllerWithIdentifier:screenName];
        }    }
    @catch (NSException *exception) {
        NSLog(@"Exception , %@",exception);
    }
    return controller;
}

@end
