//
//  ProcessIndicator.m
//  Foodipto
//

//  Copyright (c) 2013 Azilen. All rights reserved.
//

#import "ProcessIndicator.h"
//#import "AppConstants.h"

//#import "LanguageHandler.h"
#import "AppDelegate.h"

@implementation ProcessIndicator
@synthesize hud;

static ProcessIndicator *processIndicator = nil;

//============= singleton object ===============//
+ (ProcessIndicator*)sharedInstance {
	
    if (!processIndicator){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            processIndicator = [[self alloc] init];
            [processIndicator initialize];
        });
    }
    return processIndicator;
}
- (void)initialize {
    
}

//========= Display process indicator ============//
- (void)showProcessIndicatorInView:(NSString*)message
{
    AppDelegate *appDelegate = (AppDelegate *)[NSApp delegate];

    __weak NSView *view = appDelegate.mainWindowController.rootViewController.view;

    [[ProcessIndicator sharedInstance] hideProcessIndicator];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    self.hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    self.hud.color = [NSColor blackColor];
    self.hud.dimBackground = YES;
    self.hud.labelText = NSLocalizedStringCustom(message);
//    [self.hud hide:YES afterDelay:5*60.0];
}

//========== Hide process indicator ============//
- (void)hideProcessIndicator
{
    [self.hud hide:YES];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
	[MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
}

//========== Indicator with check-mark ============//
- (void)completeTaskWithMessage:(NSString*)msg displayTime:(int)delay IsFail:(BOOL)isFail
{
    UIImageView *imageView = [[UIImageView alloc] init];

    if(isFail){
    imageView.image=[UIImage imageNamed:@"tick_OK.png"];
    }
    
    else{
        imageView.image=[UIImage imageNamed:@"tick_Cancel.png"];
        
    }
     self.hud.customView = imageView;
    self.hud.mode = MBProgressHUDModeCustomView;
    self.hud.labelText = msg;
    self.hud.color = [UIColor blackColor];
    [self.hud hide:YES afterDelay:delay];
}

@end
