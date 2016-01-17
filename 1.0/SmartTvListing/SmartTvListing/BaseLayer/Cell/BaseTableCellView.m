//
//  BaseTableCellView.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/17/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "BaseTableCellView.h"

@implementation BaseTableCellView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}


-(void)updateCell:(id)model
{
    NSLog(@"%@",[NSString stringWithFormat:@"You must override method '%@' in %@", NSStringFromSelector(_cmd),NSStringFromClass([self class])]);
}

@end
