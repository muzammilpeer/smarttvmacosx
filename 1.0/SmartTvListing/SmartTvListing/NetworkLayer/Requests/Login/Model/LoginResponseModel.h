//
//  LoginResponseModel.h
//
//  Created by Muzammil Peer on 1/17/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LoginData;

@interface LoginResponseModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) LoginData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
