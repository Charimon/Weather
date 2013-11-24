//
//  WLoader.h
//  Weather
//
//  Created by Andrew Charkin on 11/23/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WWeatherParameters.h"
#import "WWeatherGroup.h"

@interface WLoader : NSObject
+(void) getWeatherAtLocation: (CLLocation *) location WithCompletion:(void (^) (WWeatherGroup *weather)) completion failure:(void (^) (NSError *error)) failure;
+(void) getWeatherAtBestLocation: (NSArray *) locations WithCompletion:(void (^) (WWeatherGroup *weather)) completion failure:(void (^) (NSError *error)) failure;

@end
