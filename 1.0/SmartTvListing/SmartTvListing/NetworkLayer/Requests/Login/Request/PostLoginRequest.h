//
//  AddAppointmentRequest.h
//  SDTPS
//
//  Created by Faran Rasheed on 13/05/2015.
//  Copyright (c) 2015 Bhavin Chitroda. All rights reserved.
//

#import "BaseNetworkRequest.h"
#import "LoginRequestModel.h"

@interface PostLoginRequest : BaseNetworkRequest
- (instancetype)initWithModel:(LoginRequestModel *) model;
@end
