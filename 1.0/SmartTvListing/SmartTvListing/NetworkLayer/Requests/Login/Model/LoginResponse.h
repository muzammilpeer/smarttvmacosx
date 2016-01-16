//
//  Response.h
//
//  Created by Muzammil Peer on 1/17/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LoginResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *customerType;
@property (nonatomic, strong) NSString *customerID;
@property (nonatomic, strong) NSString *subscriptionType;
@property (nonatomic, strong) NSString *verificationStatus;
@property (nonatomic, strong) NSString *responseCode;
@property (nonatomic, strong) NSString *lastName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
