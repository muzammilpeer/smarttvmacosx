//
//  AddAppointmentRequest.m
//  SDTPS
//
//  Created by Faran Rasheed on 13/05/2015.
//  Copyright (c) 2015 Bhavin Chitroda. All rights reserved.
//

#import "WitribeCommomRequest.h"

@interface WitribeCommomRequest ()
{
    CommonRequestModel *currentModel;
}
@end

@implementation WitribeCommomRequest


- (instancetype)initWithServiceName:(NSString *)serviceName withMethodName:(NSString*)methodName withParameters:(NSArray*)parameters withEnum:(NSInteger)requestEnum
{
    currentModel = [[CommonRequestModel alloc] init];
    currentModel.serviceName = serviceName;
    currentModel.methodName = methodName;
    currentModel.parameters = parameters;
    
   return [super initWithModel:currentModel withRequestType:requestEnum];
}

- (NSString *) url {
    NSString *url = [NSString stringWithFormat:@"%@",@"http://pitelevision.com/amfphp/Amfphp/index.php?contentType=application/json"];
    NSLog(@"%@",url);
    return url;
}

-(BOOL) havePostData {
    return YES;
}

-(NSDictionary *) postData
{
//    NSLog(@"postData->WitribeCommomRequest = %@",[currentModel dictionaryRepresentation]);
    return [currentModel dictionaryRepresentation];
}



@end
