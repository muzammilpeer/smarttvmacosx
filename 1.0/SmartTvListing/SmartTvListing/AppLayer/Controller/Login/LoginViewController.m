//
//  LoginViewController.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "LoginViewController.h"
#import "LiveChannelsCategoriesViewController.h"

#import "LoginResponseModel.h"
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
    LiveChannelsCategoriesViewController *controller = GetStoryBoardAccordingToModule(@"Main", @"LiveChannelsCategoriesViewController");
    [self.navigationController pushViewController:controller animated:YES];
    

}

- (void)postLoginRequest{
    
    NSArray *parameters = [NSArray arrayWithObjects:@"muzammilpeer98744",@"pa5is8an", nil];
    WitribeCommomRequest *request = [[WitribeCommomRequest alloc] initWithServiceName:@"NewWiTribeService" withMethodName:@"loginWiTribeUser" withParameters:parameters withEnum:kRequestTypeLogin];
    
    [[NetworkManager sharedInstance] executeRequest:request withDelegate:self];
}

#pragma mark - ResponseProtocol

- (void) successWithData:(id) data andRequestType:(NSInteger)requestType {
    [super successWithData:data andRequestType:requestType];
    
    if (kRequestTypeLogin == requestType)
    {
        LoginResponseModel *model = [[LoginResponseModel alloc] initWithDictionary:data];
//        NSLog(@"Login = %@",[model dictionaryRepresentation]);
        
        [DefaultsManagerUtil setUserDefaults:model key:kDefaultKeyUserDetail];
        
        if ([model.data.response.token length] > 0) {
            LiveChannelsCategoriesViewController *controller = GetStoryBoardAccordingToModule(@"Main", @"LiveChannelsCategoriesViewController");
            [self.navigationController pushViewController:controller animated:YES];
            
            if ([self.navigationController.viewControllerStack count] >=1) {
                [self.navigationController.viewControllerStack removeObjectAtIndex:0];
            }

        }
        
    }
}

- (void) responseWithError:(NSError *) error andRequestType:(NSInteger)requestType{
    [super responseWithError:error andRequestType:requestType];
}



@end
