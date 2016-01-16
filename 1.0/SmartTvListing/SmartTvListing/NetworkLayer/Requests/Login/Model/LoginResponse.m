//
//  Response.m
//
//  Created by Muzammil Peer on 1/17/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LoginResponse.h"


NSString *const kResponseToken = @"Token";
NSString *const kResponseUserId = @"userId";
NSString *const kResponseFirstName = @"firstName";
NSString *const kResponseCustomerType = @"customerType";
NSString *const kResponseCustomerID = @"customerID";
NSString *const kResponseSubscriptionType = @"subscriptionType";
NSString *const kResponseVerificationStatus = @"verificationStatus";
NSString *const kResponseResponseCode = @"responseCode";
NSString *const kResponseLastName = @"lastName";


@interface LoginResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginResponse

@synthesize token = _token;
@synthesize userId = _userId;
@synthesize firstName = _firstName;
@synthesize customerType = _customerType;
@synthesize customerID = _customerID;
@synthesize subscriptionType = _subscriptionType;
@synthesize verificationStatus = _verificationStatus;
@synthesize responseCode = _responseCode;
@synthesize lastName = _lastName;


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
            self.token = [self objectOrNilForKey:kResponseToken fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kResponseUserId fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kResponseFirstName fromDictionary:dict];
            self.customerType = [self objectOrNilForKey:kResponseCustomerType fromDictionary:dict];
            self.customerID = [self objectOrNilForKey:kResponseCustomerID fromDictionary:dict];
            self.subscriptionType = [self objectOrNilForKey:kResponseSubscriptionType fromDictionary:dict];
            self.verificationStatus = [self objectOrNilForKey:kResponseVerificationStatus fromDictionary:dict];
            self.responseCode = [self objectOrNilForKey:kResponseResponseCode fromDictionary:dict];
            self.lastName = [self objectOrNilForKey:kResponseLastName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.token forKey:kResponseToken];
    [mutableDict setValue:self.userId forKey:kResponseUserId];
    [mutableDict setValue:self.firstName forKey:kResponseFirstName];
    [mutableDict setValue:self.customerType forKey:kResponseCustomerType];
    [mutableDict setValue:self.customerID forKey:kResponseCustomerID];
    [mutableDict setValue:self.subscriptionType forKey:kResponseSubscriptionType];
    [mutableDict setValue:self.verificationStatus forKey:kResponseVerificationStatus];
    [mutableDict setValue:self.responseCode forKey:kResponseResponseCode];
    [mutableDict setValue:self.lastName forKey:kResponseLastName];

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

    self.token = [aDecoder decodeObjectForKey:kResponseToken];
    self.userId = [aDecoder decodeObjectForKey:kResponseUserId];
    self.firstName = [aDecoder decodeObjectForKey:kResponseFirstName];
    self.customerType = [aDecoder decodeObjectForKey:kResponseCustomerType];
    self.customerID = [aDecoder decodeObjectForKey:kResponseCustomerID];
    self.subscriptionType = [aDecoder decodeObjectForKey:kResponseSubscriptionType];
    self.verificationStatus = [aDecoder decodeObjectForKey:kResponseVerificationStatus];
    self.responseCode = [aDecoder decodeObjectForKey:kResponseResponseCode];
    self.lastName = [aDecoder decodeObjectForKey:kResponseLastName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_token forKey:kResponseToken];
    [aCoder encodeObject:_userId forKey:kResponseUserId];
    [aCoder encodeObject:_firstName forKey:kResponseFirstName];
    [aCoder encodeObject:_customerType forKey:kResponseCustomerType];
    [aCoder encodeObject:_customerID forKey:kResponseCustomerID];
    [aCoder encodeObject:_subscriptionType forKey:kResponseSubscriptionType];
    [aCoder encodeObject:_verificationStatus forKey:kResponseVerificationStatus];
    [aCoder encodeObject:_responseCode forKey:kResponseResponseCode];
    [aCoder encodeObject:_lastName forKey:kResponseLastName];
}

- (id)copyWithZone:(NSZone *)zone
{
    LoginResponse *copy = [[LoginResponse alloc] init];
    
    if (copy) {

        copy.token = [self.token copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
        copy.customerType = [self.customerType copyWithZone:zone];
        copy.customerID = [self.customerID copyWithZone:zone];
        copy.subscriptionType = [self.subscriptionType copyWithZone:zone];
        copy.verificationStatus = [self.verificationStatus copyWithZone:zone];
        copy.responseCode = [self.responseCode copyWithZone:zone];
        copy.lastName = [self.lastName copyWithZone:zone];
    }
    
    return copy;
}


@end
