//
//  CommonRequestModel.m
//
//  Created by Muzammil Peer on 1/17/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CommonRequestModel.h"


NSString *const kCommonRequestModelParameters = @"parameters";
NSString *const kCommonRequestModelServiceName = @"serviceName";
NSString *const kCommonRequestModelMethodName = @"methodName";


@interface CommonRequestModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CommonRequestModel

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
            self.parameters = [self objectOrNilForKey:kCommonRequestModelParameters fromDictionary:dict];
            self.serviceName = [self objectOrNilForKey:kCommonRequestModelServiceName fromDictionary:dict];
            self.methodName = [self objectOrNilForKey:kCommonRequestModelMethodName fromDictionary:dict];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForParameters] forKey:kCommonRequestModelParameters];
    [mutableDict setValue:self.serviceName forKey:kCommonRequestModelServiceName];
    [mutableDict setValue:self.methodName forKey:kCommonRequestModelMethodName];

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

    self.parameters = [aDecoder decodeObjectForKey:kCommonRequestModelParameters];
    self.serviceName = [aDecoder decodeObjectForKey:kCommonRequestModelServiceName];
    self.methodName = [aDecoder decodeObjectForKey:kCommonRequestModelMethodName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_parameters forKey:kCommonRequestModelParameters];
    [aCoder encodeObject:_serviceName forKey:kCommonRequestModelServiceName];
    [aCoder encodeObject:_methodName forKey:kCommonRequestModelMethodName];
}

- (id)copyWithZone:(NSZone *)zone
{
    CommonRequestModel *copy = [[CommonRequestModel alloc] init];
    
    if (copy) {

        copy.parameters = [self.parameters copyWithZone:zone];
        copy.serviceName = [self.serviceName copyWithZone:zone];
        copy.methodName = [self.methodName copyWithZone:zone];
    }
    
    return copy;
}


@end
