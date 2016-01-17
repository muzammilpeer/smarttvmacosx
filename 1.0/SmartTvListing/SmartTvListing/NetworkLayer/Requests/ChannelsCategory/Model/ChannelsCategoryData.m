//
//  Data.m
//
//  Created by Muzammil Peer on 1/17/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ChannelsCategoryData.h"


NSString *const kChannelsCategoryDataId = @"id";
NSString *const kChannelsCategoryDataDisplayTitle = @"displayTitle";
NSString *const kChannelsCategoryDataName = @"name";
NSString *const kChannelsCategoryDataImage = @"image";


@interface ChannelsCategoryData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ChannelsCategoryData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize displayTitle = _displayTitle;
@synthesize name = _name;
@synthesize image = _image;


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
            self.dataIdentifier = [self objectOrNilForKey:kChannelsCategoryDataId fromDictionary:dict];
            self.displayTitle = [self objectOrNilForKey:kChannelsCategoryDataDisplayTitle fromDictionary:dict];
            self.name = [self objectOrNilForKey:kChannelsCategoryDataName fromDictionary:dict];
            self.image = [self objectOrNilForKey:kChannelsCategoryDataImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kChannelsCategoryDataId];
    [mutableDict setValue:self.displayTitle forKey:kChannelsCategoryDataDisplayTitle];
    [mutableDict setValue:self.name forKey:kChannelsCategoryDataName];
    [mutableDict setValue:self.image forKey:kChannelsCategoryDataImage];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kChannelsCategoryDataId];
    self.displayTitle = [aDecoder decodeObjectForKey:kChannelsCategoryDataDisplayTitle];
    self.name = [aDecoder decodeObjectForKey:kChannelsCategoryDataName];
    self.image = [aDecoder decodeObjectForKey:kChannelsCategoryDataImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kChannelsCategoryDataId];
    [aCoder encodeObject:_displayTitle forKey:kChannelsCategoryDataDisplayTitle];
    [aCoder encodeObject:_name forKey:kChannelsCategoryDataName];
    [aCoder encodeObject:_image forKey:kChannelsCategoryDataImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    ChannelsCategoryData *copy = [[ChannelsCategoryData alloc] init];
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.displayTitle = [self.displayTitle copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
    }
    
    return copy;
}


@end
