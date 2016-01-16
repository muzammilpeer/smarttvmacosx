//
//  Data.m
//
//  Created by Muzammil Peer on 1/17/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LoginData.h"
#import "LoginResponse.h"


NSString *const kDataResult = @"result";
NSString *const kDataMessage = @"message";
NSString *const kDataResponse = @"response";


@interface LoginData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginData

@synthesize result = _result;
@synthesize message = _message;
@synthesize response = _response;


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
            self.result = [[self objectOrNilForKey:kDataResult fromDictionary:dict] boolValue];
            self.message = [self objectOrNilForKey:kDataMessage fromDictionary:dict];
            self.response = [LoginResponse modelObjectWithDictionary:[dict objectForKey:kDataResponse]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.result] forKey:kDataResult];
    [mutableDict setValue:self.message forKey:kDataMessage];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kDataResponse];

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

    self.result = [aDecoder decodeBoolForKey:kDataResult];
    self.message = [aDecoder decodeObjectForKey:kDataMessage];
    self.response = [aDecoder decodeObjectForKey:kDataResponse];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_result forKey:kDataResult];
    [aCoder encodeObject:_message forKey:kDataMessage];
    [aCoder encodeObject:_response forKey:kDataResponse];
}

- (id)copyWithZone:(NSZone *)zone
{
    LoginData *copy = [[LoginData alloc] init];
    
    if (copy) {

        copy.result = self.result;
        copy.message = [self.message copyWithZone:zone];
        copy.response = [self.response copyWithZone:zone];
    }
    
    return copy;
}


@end
