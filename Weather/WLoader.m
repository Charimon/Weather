//
//  WLoader.m
//  Weather
//
//  Created by Andrew Charkin on 11/23/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WLoader.h"
#import <CoreLocation/CoreLocation.h>
#import "WWeatherParameters.h"
#import "WRestkitManager.h"
#import "WConstants.h"

@implementation WLoader

+(void) reverseGeocode: (CLLocation *) location WithCompletion:(void (^) (CLPlacemark *placemark)) completion failure:(void (^) (NSError *error)) failure {
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if(placemarks.count > 0 && completion) completion([placemarks objectAtIndex:0]);
        else if(failure) failure([NSError  errorWithDomain:@"com.weather" code:2 userInfo:nil]);
    }];
}

+(void) getWeatherAtLocation: (CLLocation *) location WithCompletion:(void (^) (WWeatherGroup *weather)) completion failure:(void (^) (NSError *error)) failure {
    [self reverseGeocode:location WithCompletion:^(CLPlacemark *placemark) {
        WWeatherParameters *params = [[WWeatherParameters alloc] initWithQuery:[NSString stringWithFormat:@"%f,%f", location.coordinate.latitude,location.coordinate.longitude]];
        
        [[WRestkitManager sharedInstance].objectManager getObjectsAtPath:WWO_LOCAL_WEATHER_URL parameters:params.toDictionary success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
            if(mappingResult.firstObject && completion){
                WWeatherGroup *weatherGroup = mappingResult.firstObject;
                weatherGroup.placemark = placemark;
                completion(weatherGroup);
            }
            else if(failure) failure([NSError  errorWithDomain:@"com.weather" code:1 userInfo:nil]);
        } failure:^(RKObjectRequestOperation *operation, NSError *error) {
            if(failure) failure([NSError  errorWithDomain:@"com.weather" code:1 userInfo:nil]);
        }];
    } failure:^(NSError *error) { if(failure) failure(error); }];
}

+(void) getWeatherAtBestLocation: (NSArray *) locations WithCompletion:(void (^) (WWeatherGroup *weather)) completion failure:(void (^) (NSError *error)) failure {
    if(locations.count > 0) [self getWeatherAtLocation:[locations objectAtIndex:0] WithCompletion:completion failure:failure];
    else if (failure) failure([NSError  errorWithDomain:@"com.weather" code:1 userInfo:nil]);
}

@end
