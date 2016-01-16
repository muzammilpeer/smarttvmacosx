//
//  LoginRequestModel.h
//
//  Created by Muzammil Peer on 1/17/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LoginRequestModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *parameters;
@property (nonatomic, strong) NSString *serviceName;
@property (nonatomic, strong) NSString *methodName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
