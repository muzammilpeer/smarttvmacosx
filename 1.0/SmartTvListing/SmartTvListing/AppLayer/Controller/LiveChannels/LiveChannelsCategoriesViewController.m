//
//  LiveChannelsCategoriesViewController.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/17/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "LiveChannelsCategoriesViewController.h"
#import "LiveChannelsListViewController.h"

#import "ChannelsCategoryData.h"
#import "ChannelsCategoryResponseModel.h"

@interface LiveChannelsCategoriesViewController ()

@property (weak) IBOutlet NSButton *bBackView;

@property (weak) IBOutlet NSTableView *tbChannelsCategories;
@property (weak) IBOutlet NSTextField *lScreenTitle;
@end

@implementation LiveChannelsCategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    if ([self.navigationController.viewControllerStack count] == 1) {
        [self.bBackView setHidden:YES];
    }else {
        [self.bBackView setHidden:YES];
    }
    cell_identifier_table = @"LiveChannelsCategoryTableCellViewIdentifier";
    [self postChannelsCategoriesRequest];
    
    [self.tbChannelsCategories setAllowsEmptySelection:YES];
    [self.tbChannelsCategories setAllowsMultipleSelection:NO];
    [self.tbChannelsCategories setAllowsTypeSelect:YES];
}

- (IBAction)actionBackPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    NSLog(@"NavigationStackCount = %lu",[self.navigationController.viewControllerStack count]);
}


- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row
{
    return YES;
}


- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    [super tableViewSelectionDidChange:notification];
    NSInteger selecedIndex = [[notification object] selectedRow];
    
    ChannelsCategoryData *selectedModel = [self.localDataSource objectAtIndex:selecedIndex];
    
    LiveChannelsListViewController *controller = GetStoryBoardAccordingToModule(@"Main", @"LiveChannelsListViewController");
    controller.sharedData = selectedModel;
    
    [self.navigationController pushViewController:controller animated:YES];

    
}
- (void)tableViewSelectionIsChanging:(NSNotification *)notification
{
    [super tableViewSelectionIsChanging:notification];
}

- (BOOL)selectionShouldChangeInTableView:(NSTableView *)tableView
{
    return [super selectionShouldChangeInTableView:tableView];
}


- (void)postChannelsCategoriesRequest{
    
    [self showProgressBar];
    
    NSArray *parameters = [NSArray array];
    
    
    WitribeCommomRequest *request = [[WitribeCommomRequest alloc] initWithServiceName:@"NewWiTribeService" withMethodName:@"getChannelCategories" withParameters:parameters withEnum:kRequestTypeChannelsCategories];
    
    [[NetworkManager sharedInstance] executeRequest:request withDelegate:self];
}

#pragma mark - ResponseProtocol

- (void) successWithData:(id) data andRequestType:(NSInteger)requestType {
    [super successWithData:data andRequestType:requestType];
    
    if (kRequestTypeChannelsCategories == requestType)
    {
        ChannelsCategoryResponseModel *model = [[ChannelsCategoryResponseModel alloc] initWithDictionary:data];
//        NSLog(@"ChannelsCategoryResponseModel = %@",[model dictionaryRepresentation]);
        
        if ([model.data count] > 0) {
            [self.localDataSource removeAllObjects];
            [self.localDataSource addObjectsFromArray:model.data];
            [self.tbChannelsCategories reloadData];
            
            //            LiveChannelsListViewController *controller = GetStoryBoardAccordingToModule(@"Main", @"LiveChannelsListViewController");
            //            [self.navigationController pushViewController:controller animated:YES];
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
