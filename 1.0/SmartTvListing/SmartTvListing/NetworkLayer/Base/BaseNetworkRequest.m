//
//  NetworkManager.m
//  Communique
//
//  Created by Hussain Mansoor on 7/2/14.
//  Copyright (c) 2014 Foomo. All rights reserved.
//

#import "BaseNetworkRequest.h"

@interface BaseNetworkRequest ()
{
    
}


@property (nonatomic) NSInteger requestType;
@property (nonatomic, strong) id localData;
@end

@implementation BaseNetworkRequest

//public constructor
- (instancetype)initWithModel: (id) model withRequestType:(NSInteger) requestType
{
    self = [super init];
    if (self)
    {
        self.localData = model;
        self.requestType = requestType;
    }
    return self;
}

//public getters
- (NSInteger) getRequestType
{
    return self.requestType;
}

- (id) getLocalData
{
    return self.localData;
}

- (NSString *) url {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override method '%@' in %@", NSStringFromSelector(_cmd),NSStringFromClass([self class])]
                                 userInfo:nil];
}

- (BOOL) haveGetData {
    return NO;
}

- (NSDictionary *) getData {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                          reason:[NSString stringWithFormat:@"You must override method '%@' in %@", NSStringFromSelector(_cmd),NSStringFromClass([self class])]
                                        userInfo:nil];
}

- (BOOL) havePostData {
    return NO;
}

- (NSDictionary *) postData {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override method '%@' in %@", NSStringFromSelector(_cmd),NSStringFromClass([self class])]
                                 userInfo:nil];
}

- (BOOL) haveImageData {
    return NO;
}

- (NSImage*) imageData {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override method '%@' in %@", NSStringFromSelector(_cmd),NSStringFromClass([self class])]
                                 userInfo:nil];
}

@end
