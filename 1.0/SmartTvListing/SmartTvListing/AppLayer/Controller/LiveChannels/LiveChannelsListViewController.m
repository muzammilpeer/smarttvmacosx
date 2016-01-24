//
//  LiveChannelsListViewController.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "LiveChannelsListViewController.h"
#import "VideoPlayerViewController.h"
#import "ChannelsResponseModel.h"
#import "ChannelsData.h"
#import "ChannelsCategoryData.h"

@interface LiveChannelsListViewController ()
{
    ChannelsCategoryData* selectedModel;
}
@property (weak) IBOutlet NSTableView *tbChannelsCategories;
@property (weak) IBOutlet NSTextField *lScreenTitle;
@end

@implementation LiveChannelsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    
    if ([self.sharedData isKindOfClass:[ChannelsCategoryData class]]) {
        selectedModel = (ChannelsCategoryData*)self.sharedData;
        
       self.lScreenTitle.stringValue  = MERGE_STRING(@"Channel > ", selectedModel.name);
    }
    
    cell_identifier_table = @"LiveChannelsCategoryTableCellViewIdentifier";
    
    [self postChannelsCategoriesRequest];
}
- (IBAction)actionBackPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    NSLog(@"NavigationStackCount = %lu",[self.navigationController.viewControllerStack count]);
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification
{
    NSLog(@"Row selection = %ld",[[aNotification object] selectedRow]);
    NSInteger selecedIndex = [[aNotification object] selectedRow];
    
    ChannelsData *selectedModel = [self.localDataSource objectAtIndex:selecedIndex];
    
    VideoPlayerViewController *controller = GetStoryBoardAccordingToModule(@"Main", @"VideoPlayerViewController");
    controller.sharedData = selectedModel;
    [self.navigationController pushViewController:controller animated:YES];
}



- (void)postChannelsCategoriesRequest{
    [self showProgressBar];
    
    NSArray *parameters = [NSArray array];
    WitribeCommomRequest *request = [[WitribeCommomRequest alloc] initWithServiceName:@"NewWiTribeService" withMethodName:@"getAllChannels" withParameters:parameters withEnum:kRequestTypeChannelsCategories];
    
    [[NetworkManager sharedInstance] executeRequest:request withDelegate:self];
}

#pragma mark - ResponseProtocol

- (void) successWithData:(id) data andRequestType:(NSInteger)requestType {
    [super successWithData:data andRequestType:requestType];
    
    if (kRequestTypeChannelsCategories == requestType)
    {
        ChannelsResponseModel *model = [[ChannelsResponseModel alloc] initWithDictionary:data];
//        NSLog(@"ChannelsCategoryResponseModel = %@",[model dictionaryRepresentation]);
        
        if ([model.data count] > 0) {
            [self.localDataSource removeAllObjects];
            
            if ([[selectedModel.displayTitle lowercaseString] isEqualToString:@"all"]) {
                [self.localDataSource addObjectsFromArray:model.data];
            } else if ([[selectedModel.displayTitle lowercaseString] isEqualToString:@"international"]) {
                
                for (int i=0; i<model.data.count; i++) {
                    ChannelsData *obj = [model.data objectAtIndex:i];
                    if ([[obj.packageId lowercaseString] isEqualToString:@"6"]) {
                        [self.localDataSource addObject:obj];
                    }
                }
            } else {
                for (int i=0; i<model.data.count; i++) {
                    ChannelsData *obj = [model.data objectAtIndex:i];
                    if ([[obj.category lowercaseString] isEqualToString:[selectedModel.displayTitle lowercaseString]]) {
                        [self.localDataSource addObject:obj];
                    }
                }
            }
            
            [self.tbChannelsCategories reloadData];
            
        }
        
    }
}

- (void) responseWithError:(NSError *) error andRequestType:(NSInteger)requestType{
    [super responseWithError:error andRequestType:requestType];
    
    if (kRequestTypeChannelsCategories == requestType)
    {
    }
    
}

@end
