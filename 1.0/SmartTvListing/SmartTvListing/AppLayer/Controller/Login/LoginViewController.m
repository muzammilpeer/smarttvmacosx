//
//  LoginViewController.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "LiveChannelsListViewController.h"
#import "NSNavigationController.h"
#import "LoginResponseModel.h"
#import "NetworkManager.h"
#import "PostLoginRequest.h"
#import "LoginData.h"
#import "LoginResponse.h"

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   

}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}


- (IBAction)actionSignInClick:(id)sender {
    
    [self postLoginRequest];
}

- (IBAction)actionSignUpClick:(id)sender {
    LiveChannelsListViewController *controller = GetStoryBoardAccordingToModule(@"Main", @"LiveChannelsListViewController");
    [self.navigationController pushViewController:controller animated:YES];
    

}

- (void)postLoginRequest{
    
    LoginRequestModel *model = [[LoginRequestModel alloc] init];
    model.serviceName = @"NewWiTribeService";
    model.methodName = @"loginWiTribeUser";
    model.parameters = [NSArray arrayWithObjects:@"muzammilpeer98744",@"pa5is8an", nil];

    
    PostLoginRequest *req = [[PostLoginRequest alloc] initWithModel:model];
    
    [[NetworkManager sharedInstance] executeRequest:req withDelegate:self requestType:1];
}

#pragma mark - ResponseProtocol

- (void) successWithData:(id) data andRequestType:(NSInteger)requestType {
    [super successWithData:data andRequestType:requestType];
    
    if (1 == requestType)
    {
        LoginResponseModel *model = [[LoginResponseModel alloc] initWithDictionary:data];
        NSLog(@"Login = %@",[model dictionaryRepresentation]);
        
        if ([model.data.response.token length] > 0) {
            LiveChannelsListViewController *controller = GetStoryBoardAccordingToModule(@"Main", @"LiveChannelsListViewController");
            [self.navigationController pushViewController:controller animated:YES];
        }
        
    }
}

- (void) responseWithError:(NSError *) error andRequestType:(NSInteger)requestType{
    [super responseWithError:error andRequestType:requestType];
}



@end
