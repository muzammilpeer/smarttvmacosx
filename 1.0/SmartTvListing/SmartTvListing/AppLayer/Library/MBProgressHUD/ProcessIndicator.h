//
//  ProcessIndicator.h
//  Foodipto
//

//  Copyright (c) 2013 Azilen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface ProcessIndicator : NSObject
{
    MBProgressHUD *hud;
}
@property(nonatomic,retain)MBProgressHUD *hud;

+ (ProcessIndicator*)sharedInstance;
- (void)showProcessIndicatorInView:(NSString*)message;
- (void)hideProcessIndicator;
- (void)completeTaskWithMessage:(NSString*)msg displayTime:(int)delay IsFail:(BOOL)isFail;
@end
