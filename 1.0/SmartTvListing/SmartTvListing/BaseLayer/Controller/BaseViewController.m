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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    
    //call abstractions methods
    [self setupViewController];
    
    AppDelegate *appDelegate = (AppDelegate *)[NSApp delegate];
    
    NSLog(@"Current Window Size = %@",NSStringFromRect(appDelegate.mainWindowController.window.frame));
    NSLog(@"ViewController Window Size = %@",NSStringFromRect(self.view.frame));
    
    if (appDelegate.mainWindowController.window.frame.size.width > 0) {
        [self.view setFrame:appDelegate.mainWindowController.window.frame];
    }
    
//    appDelegate.mainWindowController.window.styleMask = NSClosableWindowMask | NSTitledWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask;

//    [self.view setFrame:appDelegate.mainWindowController.window.frame];
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
//    NSLog(@"responseWithError = %@", [error description]);
}

- (void)successWithData:(id)data andRequestType:(NSInteger)requestType
{
//    NSLog(@"successWithData = %@", data);
}


@end
