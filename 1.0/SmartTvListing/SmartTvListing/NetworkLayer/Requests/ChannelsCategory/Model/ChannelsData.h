//
//  Data.h
//
//  Created by Muzammil Peer on 1/17/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ChannelsData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *mobileLargeImage;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) NSString *videoStreamUrl;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSString *packageId;
@property (nonatomic, strong) NSString *videoStreamUrlLow;
@property (nonatomic, strong) NSString *mobileSmallImage;
@property (nonatomic, strong) NSString *totalViews;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) id dittoId;
@property (nonatomic, strong) NSString *videoIosStreamUrl;
@property (nonatomic, strong) NSString *videoIosStreamUrlLow;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
