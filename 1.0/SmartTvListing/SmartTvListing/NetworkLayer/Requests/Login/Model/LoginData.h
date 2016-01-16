//
//  Data.h
//
//  Created by Muzammil Peer on 1/17/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LoginResponse;

@interface LoginData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL result;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) LoginResponse *response;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
