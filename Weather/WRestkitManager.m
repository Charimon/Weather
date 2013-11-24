//
//  WRestkitManager.m
//  Weather
//
//  Created by Andrew Charkin on 11/22/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WRestkitManager.h"
#import "WConstants.h"
#import "WWeatherGroup.h"

@implementation WRestkitManager

@synthesize objectManager = _objectManager;

- (void) setup: (RKObjectManager *) objectManager {
    RKResponseDescriptor *getListingsResponce = [RKResponseDescriptor responseDescriptorWithMapping:[WWeatherGroup responseMapping]
                                                                                             method:RKRequestMethodGET
                                                                                        pathPattern:WWO_LOCAL_WEATHER_URL
                                                                                            keyPath:@"data"
                                                                                        statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [objectManager addResponseDescriptor:getListingsResponce];
    objectManager.requestSerializationMIMEType = RKMIMETypeJSON;
}

- (WRestkitManager *)init {
	self = [super init];
	if (self) {
        //let AFNetworking manage the activity indicator
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        
        // Initialize HTTPClient
        NSURL *baseURL = baseURL = [NSURL URLWithString:WWO_SERVER_URL_STR];
        
        AFHTTPClient* restKitClient = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
        [restKitClient setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
        [restKitClient setParameterEncoding:AFJSONParameterEncoding];
        [restKitClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
        
        // Initialize RestKit
        self.objectManager = [[RKObjectManager alloc] initWithHTTPClient:restKitClient];
        [self setup: self.objectManager];
    }
    return self;
}

static WRestkitManager *sharedInstance = nil;
+ (WRestkitManager *)sharedInstance {
    if(sharedInstance) return sharedInstance;

    //Lock This code is called at most once per app
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{ sharedInstance = [[WRestkitManager alloc] init]; });
    return sharedInstance;
}


@end
