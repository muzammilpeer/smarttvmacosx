//
//  NetworkFactory.m
//  Communique
//
//  Created by Hussain Mansoor on 7/2/14.
//  Copyright (c) 2014 Foomo. All rights reserved.
//

#import "NetworkManager.h"
#import "FLSingleton.h"
#import "ResponseProtocol.h"

@interface NetworkManager ()

- (void) respondto:(id<ResponseProtocol>)delegate WithError:(NSError *)error requestType:(NSInteger) type;
- (void) respondto:(id<ResponseProtocol>)delegate WithData:(id)data requestType:(NSInteger) type;

@end

@implementation NetworkManager

_FL_MAKE_SINGLETON(NetworkManager);

- (void) executeRequest:(BaseNetworkRequest *)request withDelegate:(id<ResponseProtocol>)delegate {
    
    if (nil == request) {
        [self respondto:delegate WithError:nil requestType:[request getRequestType]];
    }
    
//    if (![AFNetworkReachabilityManager sharedManager].reachable) {
//        [self respondto:delegate WithError:[NSError errorWithDomain:@"local" code:kApp_ErrorInternetNotAvailable userInfo:nil] requestType:requestType];
//        return;
//    }
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES; // not recommended for production
    manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
    
    if ([request havePostData]) {
        
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        [manager POST:[request  url] parameters:[request postData] progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self respondto:delegate WithData:responseObject requestType:[request getRequestType]];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self respondto:delegate WithError:error requestType:[request getRequestType]];
            
        }];
    }
    else if ([request haveGetData]) {
        
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        [manager GET:[request  url] parameters:[request postData] progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self respondto:delegate WithData:responseObject requestType:[request getRequestType]];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self respondto:delegate WithError:error requestType:[request getRequestType]];
            
        }];

        
//        AFHTTPRequestOperation *operation = [manager GET:[request url] parameters:[request getData] success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
//            [self respondto:delegate WithData:responseObject requestType:requestType];
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"Error: %@", error);
//            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
//            [self respondto:delegate WithError:error requestType:requestType];
//        }];
//        operation.userInfo = @{kNetworkManagerKey_RequestType:[NSNumber numberWithInteger:requestType]};
    }
    else if ([request haveImageData]) {

//        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//        AFJSONResponseSerializer *jsonReponseSerializer = [AFJSONResponseSerializer serializer];
//        // This will make the AFJSONResponseSerializer accept any content type
//        jsonReponseSerializer.acceptableContentTypes = nil;
//        manager.responseSerializer = jsonReponseSerializer;
//        
//        
//        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain; charset=utf-8"];
//        
//        AFHTTPRequestOperation *operation = [manager POST:[request url] parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//
//            [formData appendPartWithFileData:UIImagePNGRepresentation([request imageData]) name:@"images" fileName:@"image.png" mimeType:@"*/*"];
//        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
//            [self respondto:delegate WithData:responseObject requestType:requestType];
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"Error: %@", error);
//            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
//            [self respondto:delegate WithError:error requestType:requestType];
//        }];
//        operation.userInfo = @{kNetworkManagerKey_RequestType:[NSNumber numberWithInteger:requestType]};
    }
    else {
//        AFHTTPRequestOperation *operation = [manager GET:[request url] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
//            [self respondto:delegate WithData:responseObject requestType:requestType];
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"Error: %@", error);
//            NSInteger requestType = [[operation.userInfo objectForKey:kNetworkManagerKey_RequestType] integerValue];
//            [self respondto:delegate WithError:error requestType:requestType];
//        }];
//        operation.userInfo = @{kNetworkManagerKey_RequestType:[NSNumber numberWithInteger:requestType]};
    }
}

- (void) respondto:(id<ResponseProtocol>)delegate WithError:(NSError *) error requestType:(NSInteger) type {
    if (nil != delegate && [delegate respondsToSelector:@selector(responseWithError:andRequestType:)]) {
        [delegate responseWithError:error andRequestType:type];
    }
}

- (void) respondto:(id<ResponseProtocol>)delegate WithData:(id)data requestType:(NSInteger) type {
    if (nil != delegate && [delegate respondsToSelector:@selector(successWithData:andRequestType:)]) {
        [delegate successWithData:data andRequestType:type];
    }
}

@end
