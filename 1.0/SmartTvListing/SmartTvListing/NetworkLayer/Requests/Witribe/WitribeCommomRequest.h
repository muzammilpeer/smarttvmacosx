//
//  AddAppointmentRequest.h
//  SDTPS
//
//  Created by Faran Rasheed on 13/05/2015.
//  Copyright (c) 2015 Bhavin Chitroda. All rights reserved.
//

#import "BaseNetworkRequest.h"

@interface WitribeCommomRequest : BaseNetworkRequest

- (instancetype)initWithServiceName:(NSString *)serviceName withMethodName:(NSString*)methodName withParameters:(NSArray*)parameters withEnum:(NSInteger)requestEnum;

@end
