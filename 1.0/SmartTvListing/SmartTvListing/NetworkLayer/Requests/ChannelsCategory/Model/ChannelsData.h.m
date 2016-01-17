//
//  Data.m
//
//  Created by Muzammil Peer on 1/17/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ChannelsData.h"


NSString *const kChannelsDataMobileLargeImage = @"mobile_large_image";
NSString *const kChannelsDataCategory = @"category";
NSString *const kChannelsDataId = @"id";
NSString *const kChannelsDataVideoStreamUrl = @"video_streamUrl";
NSString *const kChannelsDataDescription = @"description";
NSString *const kChannelsDataPackageId = @"packageId";
NSString *const kChannelsDataVideoStreamUrlLow = @"video_streamUrlLow";
NSString *const kChannelsDataMobileSmallImage = @"mobile_small_image";
NSString *const kChannelsDataTotalViews = @"totalViews";
NSString *const kChannelsDataTitle = @"title";
NSString *const kChannelsDataDittoId = @"dittoId";
NSString *const kChannelsDataVideoIosStreamUrl = @"video_iosStreamUrl";
NSString *const kChannelsDataVideoIosStreamUrlLow = @"video_iosStreamUrlLow";


@interface ChannelsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ChannelsData

@synthesize mobileLargeImage = _mobileLargeImage;
@synthesize category = _category;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize videoStreamUrl = _videoStreamUrl;
@synthesize dataDescription = _dataDescription;
@synthesize packageId = _packageId;
@synthesize videoStreamUrlLow = _videoStreamUrlLow;
@synthesize mobileSmallImage = _mobileSmallImage;
@synthesize totalViews = _totalViews;
@synthesize title = _title;
@synthesize dittoId = _dittoId;
@synthesize videoIosStreamUrl = _videoIosStreamUrl;
@synthesize videoIosStreamUrlLow = _videoIosStreamUrlLow;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.mobileLargeImage = [self objectOrNilForKey:kChannelsDataMobileLargeImage fromDictionary:dict];
            self.category = [self objectOrNilForKey:kChannelsDataCategory fromDictionary:dict];
            self.dataIdentifier = [self objectOrNilForKey:kChannelsDataId fromDictionary:dict];
            self.videoStreamUrl = [self objectOrNilForKey:kChannelsDataVideoStreamUrl fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kChannelsDataDescription fromDictionary:dict];
            self.packageId = [self objectOrNilForKey:kChannelsDataPackageId fromDictionary:dict];
            self.videoStreamUrlLow = [self objectOrNilForKey:kChannelsDataVideoStreamUrlLow fromDictionary:dict];
            self.mobileSmallImage = [self objectOrNilForKey:kChannelsDataMobileSmallImage fromDictionary:dict];
            self.totalViews = [self objectOrNilForKey:kChannelsDataTotalViews fromDictionary:dict];
            self.title = [self objectOrNilForKey:kChannelsDataTitle fromDictionary:dict];
            self.dittoId = [self objectOrNilForKey:kChannelsDataDittoId fromDictionary:dict];
            self.videoIosStreamUrl = [self objectOrNilForKey:kChannelsDataVideoIosStreamUrl fromDictionary:dict];
            self.videoIosStreamUrlLow = [self objectOrNilForKey:kChannelsDataVideoIosStreamUrlLow fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.mobileLargeImage forKey:kChannelsDataMobileLargeImage];
    [mutableDict setValue:self.category forKey:kChannelsDataCategory];
    [mutableDict setValue:self.dataIdentifier forKey:kChannelsDataId];
    [mutableDict setValue:self.videoStreamUrl forKey:kChannelsDataVideoStreamUrl];
    [mutableDict setValue:self.dataDescription forKey:kChannelsDataDescription];
    [mutableDict setValue:self.packageId forKey:kChannelsDataPackageId];
    [mutableDict setValue:self.videoStreamUrlLow forKey:kChannelsDataVideoStreamUrlLow];
    [mutableDict setValue:self.mobileSmallImage forKey:kChannelsDataMobileSmallImage];
    [mutableDict setValue:self.totalViews forKey:kChannelsDataTotalViews];
    [mutableDict setValue:self.title forKey:kChannelsDataTitle];
    [mutableDict setValue:self.dittoId forKey:kChannelsDataDittoId];
    [mutableDict setValue:self.videoIosStreamUrl forKey:kChannelsDataVideoIosStreamUrl];
    [mutableDict setValue:self.videoIosStreamUrlLow forKey:kChannelsDataVideoIosStreamUrlLow];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.mobileLargeImage = [aDecoder decodeObjectForKey:kChannelsDataMobileLargeImage];
    self.category = [aDecoder decodeObjectForKey:kChannelsDataCategory];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kChannelsDataId];
    self.videoStreamUrl = [aDecoder decodeObjectForKey:kChannelsDataVideoStreamUrl];
    self.dataDescription = [aDecoder decodeObjectForKey:kChannelsDataDescription];
    self.packageId = [aDecoder decodeObjectForKey:kChannelsDataPackageId];
    self.videoStreamUrlLow = [aDecoder decodeObjectForKey:kChannelsDataVideoStreamUrlLow];
    self.mobileSmallImage = [aDecoder decodeObjectForKey:kChannelsDataMobileSmallImage];
    self.totalViews = [aDecoder decodeObjectForKey:kChannelsDataTotalViews];
    self.title = [aDecoder decodeObjectForKey:kChannelsDataTitle];
    self.dittoId = [aDecoder decodeObjectForKey:kChannelsDataDittoId];
    self.videoIosStreamUrl = [aDecoder decodeObjectForKey:kChannelsDataVideoIosStreamUrl];
    self.videoIosStreamUrlLow = [aDecoder decodeObjectForKey:kChannelsDataVideoIosStreamUrlLow];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_mobileLargeImage forKey:kChannelsDataMobileLargeImage];
    [aCoder encodeObject:_category forKey:kChannelsDataCategory];
    [aCoder encodeObject:_dataIdentifier forKey:kChannelsDataId];
    [aCoder encodeObject:_videoStreamUrl forKey:kChannelsDataVideoStreamUrl];
    [aCoder encodeObject:_dataDescription forKey:kChannelsDataDescription];
    [aCoder encodeObject:_packageId forKey:kChannelsDataPackageId];
    [aCoder encodeObject:_videoStreamUrlLow forKey:kChannelsDataVideoStreamUrlLow];
    [aCoder encodeObject:_mobileSmallImage forKey:kChannelsDataMobileSmallImage];
    [aCoder encodeObject:_totalViews forKey:kChannelsDataTotalViews];
    [aCoder encodeObject:_title forKey:kChannelsDataTitle];
    [aCoder encodeObject:_dittoId forKey:kChannelsDataDittoId];
    [aCoder encodeObject:_videoIosStreamUrl forKey:kChannelsDataVideoIosStreamUrl];
    [aCoder encodeObject:_videoIosStreamUrlLow forKey:kChannelsDataVideoIosStreamUrlLow];
}

- (id)copyWithZone:(NSZone *)zone
{
    ChannelsData *copy = [[ChannelsData alloc] init];
    
    if (copy) {

        copy.mobileLargeImage = [self.mobileLargeImage copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.videoStreamUrl = [self.videoStreamUrl copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.packageId = [self.packageId copyWithZone:zone];
        copy.videoStreamUrlLow = [self.videoStreamUrlLow copyWithZone:zone];
        copy.mobileSmallImage = [self.mobileSmallImage copyWithZone:zone];
        copy.totalViews = [self.totalViews copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.dittoId = [self.dittoId copyWithZone:zone];
        copy.videoIosStreamUrl = [self.videoIosStreamUrl copyWithZone:zone];
        copy.videoIosStreamUrlLow = [self.videoIosStreamUrlLow copyWithZone:zone];
    }
    
    return copy;
}


@end
