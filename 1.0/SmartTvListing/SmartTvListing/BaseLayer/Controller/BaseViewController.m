//
//  BaseViewController.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
@interface BaseViewController ()
{
AppDelegate *appDelegate;

}

@end

@implementation BaseViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)viewWillAppear
{
    [super viewWillAppear];
    
    [appDelegate.mainWindowController.window setFrame:[[NSScreen mainScreen] frame] display:NO];
}

- (void)viewDidAppear
{
    [super viewDidAppear];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    appDelegate = (AppDelegate *)[NSApp delegate];
    [appDelegate.mainWindowController.window setFrame:[[NSScreen mainScreen] visibleFrame] display:NO];


    //call abstractions methods
    [self setupViewController];
    
    
    [appDelegate.mainWindowController.window setBackgroundColor:RGBA(63,163,63,1.0)];

    
}

- (void) showProgressBar
{
    progressHud = [MBProgressHUD showHUDAddedTo:appDelegate.mainWindowController.contentViewController.view animated:NO];
    progressHud.color = [NSColor blackColor];
    progressHud.dimBackground = YES;
}
- (void) hideProgressBar
{
    [progressHud hide:YES];
    [MBProgressHUD hideHUDForView:appDelegate.mainWindowController.contentViewController.view animated:YES];
}


- (CGRect)getCurrentScreenResolution
{
    return [[NSScreen mainScreen] frame];
}



//abstraction came here
//abstraction called by setupViewController()

- (void) setupViewController
{
    [self initViews];
    [self initObjects];
    [self initNetworkCalls];
    [self initListeners];
}

- (void) initViews   //1
{
    
    //set default cell identifier
    
    cell_identifier_table = @"defaultCellIdentifier";
    cell_identifier_collection = @"defaultCellIdentifier";
    
}

- (void) initObjects  //2
{
    //data setup
    self.localDataSource = [NSMutableArray new];
    self.localCollectionViewDataSource = [NSMutableArray new];
    
}

- (void) initNetworkCalls //3
{
    
}

- (void) initListeners //4
{
    
}

//abstraction end


//tableview
#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.localDataSource count];
}


- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    // Get a new ViewCell
    
//    BaseTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    BaseTableCellView *cellView = [tableView makeViewWithIdentifier:cell_identifier_table owner:self];
    
    //if columns 1 for other scenario's let thing about
    // Since this is a single-column table view, this would not be necessary.
    // But it's a good practice to do it in order by remember it when a table is multicolumn.
    // if( [tableColumn.identifier isEqualToString:@"BugColumn"] )
    if (cellView) {
//        cellView.tag = row;
        [cellView updateCell:[self.localDataSource objectAtIndex:row]];
    }

    return cellView;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return 100.0f;
}



- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSLog(@"base->tableViewSelectionDidChange Row selection = %ld",[[notification object] selectedRow]);
}
- (void)tableViewSelectionIsChanging:(NSNotification *)notification
{
    NSLog(@"base->tableViewSelectionIsChanging Row selection = %ld",[[notification object] selectedRow]);
    
}

- (BOOL)selectionShouldChangeInTableView:(NSTableView *)tableView
{
    NSLog(@"base->selectionShouldChangeInTableView selectedRowIndexes = %@",tableView.selectedRowIndexes);
    return YES;
}


//#pragma mark - UITableViewDelegate
//
//// Called after the user changes the selection.
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
//
//#pragma --mark CollectionViewDelegateAndDataSource
//
//- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
//{
//    return [self.collectionDataSource count];
//}
//
//- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
//{
//    return 1;
//}
//
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
//    NSLog(@"%ld", (long)indexPath.row);
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    BaseCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:cell_identifier_collection forIndexPath:indexPath];
//    if (cell) {
//        [cell updateCell:[self.collectionDataSource objectAtIndex:indexPath.row]];
//    }
//    return cell;
//    
//}
//



#pragma mark - ResponseProtocol

- (void)responseWithError:(NSError *)error andRequestType:(NSInteger)requestType
{
    [self hideProgressBar];

//    NSLog(@"responseWithError = %@", [error description]);
}

- (void)successWithData:(id)data andRequestType:(NSInteger)requestType
{
    [self hideProgressBar];
//    NSLog(@"successWithData = %@", data);
}


@end
