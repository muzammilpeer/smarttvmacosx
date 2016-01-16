//
//  AddAppointmentRequest.m
//  SDTPS
//
//  Created by Faran Rasheed on 13/05/2015.
//  Copyright (c) 2015 Bhavin Chitroda. All rights reserved.
//

#import "PostLoginRequest.h"

@interface PostLoginRequest ()
{
    LoginRequestModel *currentModel;
}
@end

@implementation PostLoginRequest

- (instancetype)initWithModel: (LoginRequestModel *) model
{
    self = [super init];
    if (self)
    {
        self.localData = model;
        currentModel = model;
    }
    return self;
}

- (NSString *) url {
    NSString *url = [NSString stringWithFormat:@"%@%@",@"http://pitelevision.com/amfphp/Amfphp/",@"index.php?contentType=application/json"];
    NSLog(@"%@",url);
    return url;
}

-(BOOL) havePostData {
    return YES;
}

-(NSDictionary *) postData
{
    NSLog(@"dict = %@",[currentModel dictionaryRepresentation]);
    
    self.localData = currentModel;
    return [currentModel dictionaryRepresentation];
}



@end
