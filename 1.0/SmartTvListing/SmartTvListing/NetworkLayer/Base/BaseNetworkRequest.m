//
//  NetworkManager.m
//  Communique
//
//  Created by Hussain Mansoor on 7/2/14.
//  Copyright (c) 2014 Foomo. All rights reserved.
//

#import "BaseNetworkRequest.h"

@implementation BaseNetworkRequest

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
