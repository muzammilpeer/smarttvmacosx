//
//  LoginRequestModel.m
//
//  Created by Muzammil Peer on 1/17/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LoginRequestModel.h"


NSString *const kLoginRequestModelParameters = @"parameters";
NSString *const kLoginRequestModelServiceName = @"serviceName";
NSString *const kLoginRequestModelMethodName = @"methodName";


@interface LoginRequestModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginRequestModel

@synthesize parameters = _parameters;
@synthesize serviceName = _serviceName;
@synthesize methodName = _methodName;


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
            self.parameters = [self objectOrNilForKey:kLoginRequestModelParameters fromDictionary:dict];
            self.serviceName = [self objectOrNilForKey:kLoginRequestModelServiceName fromDictionary:dict];
            self.methodName = [self objectOrNilForKey:kLoginRequestModelMethodName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForParameters = [NSMutableArray array];
    for (NSObject *subArrayObject in self.parameters) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForParameters addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForParameters addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForParameters] forKey:kLoginRequestModelParameters];
    [mutableDict setValue:self.serviceName forKey:kLoginRequestModelServiceName];
    [mutableDict setValue:self.methodName forKey:kLoginRequestModelMethodName];

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

    self.parameters = [aDecoder decodeObjectForKey:kLoginRequestModelParameters];
    self.serviceName = [aDecoder decodeObjectForKey:kLoginRequestModelServiceName];
    self.methodName = [aDecoder decodeObjectForKey:kLoginRequestModelMethodName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_parameters forKey:kLoginRequestModelParameters];
    [aCoder encodeObject:_serviceName forKey:kLoginRequestModelServiceName];
    [aCoder encodeObject:_methodName forKey:kLoginRequestModelMethodName];
}

- (id)copyWithZone:(NSZone *)zone
{
    LoginRequestModel *copy = [[LoginRequestModel alloc] init];
    
    if (copy) {

        copy.parameters = [self.parameters copyWithZone:zone];
        copy.serviceName = [self.serviceName copyWithZone:zone];
        copy.methodName = [self.methodName copyWithZone:zone];
    }
    
    return copy;
}


@end
