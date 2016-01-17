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
        [self.ivRecordThumbnail setImage:[NSImage imageNamed:placeholder]];
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(queue, ^{
            NSImage *downloadImage = [[NSImage alloc] initWithContentsOfURL:[NSURL URLWithString:currentModel.image]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.ivRecordThumbnail setImage:downloadImage];
            });
        });
//        NSLog(@"Data fetched = %@",[model dictionaryRepresentation]);
    }else if ([model isKindOfClass:[ChannelsData class]]) {
        ChannelsData *currentModel = (ChannelsData*)model;
        [self.lRecordID setStringValue:currentModel.dataIdentifier];
        [self.lRecordTitle setStringValue:currentModel.title];
        [self.lRecordCategory setStringValue:currentModel.category];
        [self.lRecordCount setStringValue:currentModel.totalViews];
        
        NSString *placeholder = @"AppIcon";
        NSString *imageUrl = [NSString stringWithFormat:@"%@%@",@"http://pitelevision.com/",currentModel.mobileSmallImage];
        
        [self.ivRecordThumbnail setImage:[NSImage imageNamed:placeholder]];
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(queue, ^{
            NSImage *downloadImage = [[NSImage alloc] initWithContentsOfURL:[NSURL URLWithString:imageUrl]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.ivRecordThumbnail setImage:downloadImage];
            });
        });
//        NSLog(@"Data fetched = %@",[model dictionaryRepresentation]);
    }
    
}

@end
