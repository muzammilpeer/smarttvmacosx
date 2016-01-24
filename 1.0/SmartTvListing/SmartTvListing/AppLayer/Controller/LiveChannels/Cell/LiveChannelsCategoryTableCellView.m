//
//  LiveChannelsCategoryTableCellView.m
//  SmartTvListing
//
//  Created by Muzammil Peer on 1/17/16.
//  Copyright © 2016 Muzammil Peer. All rights reserved.
//

#import "LiveChannelsCategoryTableCellView.h"
#import "ChannelsCategoryData.h"
#import "ChannelsData.h"


@interface LiveChannelsCategoryTableCellView ()
{
    
}
@property (weak) IBOutlet NSTextField *lRecordID;
@property (weak) IBOutlet NSTextField *lRecordTitle;
@property (weak) IBOutlet NSTextField *lRecordCategory;
@property (weak) IBOutlet NSTextField *lRecordCount;
@property (weak) IBOutlet NSImageView *ivRecordThumbnail;

@end

@implementation LiveChannelsCategoryTableCellView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(void)updateCell:(id)model
{
    if ([model isKindOfClass:[ChannelsCategoryData class]]) {
        ChannelsCategoryData *currentModel = (ChannelsCategoryData*)model;
        [self.lRecordID setStringValue:currentModel.dataIdentifier];
        [self.lRecordTitle setStringValue:currentModel.name];
        [self.lRecordCategory setStringValue:currentModel.displayTitle];
        [self.lRecordCount setStringValue:@"55"];
        
        NSString *placeholder = @"AppIcon";
        NSString *imageUrl = currentModel.image;
        imageUrl = [imageUrl stringByReplacingOccurrencesOfString:@" " withString:@"%20"];

        [self.ivRecordThumbnail setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[NSImage imageNamed:placeholder]];
    }else if ([model isKindOfClass:[ChannelsData class]]) {
        ChannelsData *currentModel = (ChannelsData*)model;
        [self.lRecordID setStringValue:currentModel.dataIdentifier];
        [self.lRecordTitle setStringValue:currentModel.title];
        [self.lRecordCategory setStringValue:currentModel.category];
        [self.lRecordCount setStringValue:currentModel.totalViews];
        
        NSString *placeholder = @"AppIcon";
        NSString *imageUrl = [NSString stringWithFormat:@"%@%@",@"http://pitelevision.com/",currentModel.mobileSmallImage];
        imageUrl = [imageUrl stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
        [self.ivRecordThumbnail setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[NSImage imageNamed:placeholder]];
    }
    
}

@end
