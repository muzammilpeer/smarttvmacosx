//
//  BaseViewController.h
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/16/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ResponseProtocol.h"
#import "BaseTableCellView.h"


@class NSNavigationController;

@interface BaseViewController : NSViewController<ResponseProtocol,NSTableViewDelegate,NSTableViewDataSource>
{
@protected NSString *cell_identifier_table;
@protected NSString *cell_identifier_collection;

}
@property (nonatomic, weak) NSNavigationController *navigationController;


@property (nonatomic, strong) id sharedData;
@property (nonatomic, strong) NSMutableArray *localDataSource;
@property (nonatomic, strong) NSMutableArray *localCollectionViewDataSource;

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


//abstraction called by setupViewController()

- (void) initViews;   //1
- (void) initObjects;  //2
- (void) initNetworkCalls; //3
- (void) initListeners; //4



@end
