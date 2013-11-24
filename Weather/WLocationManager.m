//
//  WLocationManager.m
//  Weather
//
//  Created by Andrew Charkin on 11/23/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WLocationManager.h"

@interface WLocationManager()
@property (nonatomic, retain) CLLocationManager *locationManger;
@property (nonatomic, strong) CLLocation *currentLocation;
@end

@implementation WLocationManager

- (id)init {
	self = [super init];
	if(self != nil) {
		self.locationManger = [[CLLocationManager alloc] init];
        self.locationManger.distanceFilter = kCLDistanceFilterNone;
        self.locationManger.pausesLocationUpdatesAutomatically = YES;
        
        self.locationManger.activityType = CLActivityTypeFitness;
        self.locationManger.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
        
		self.locationManger.delegate = self;
	}
	return self;
}

#pragma mark - Location Manager location and heading event handlers
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    [self.delegate locationUpdate:locations];
    if(locations.count > 0) {
        CLLocation * currentLocation = [locations objectAtIndex:0];
        if( (!self.currentLocation && currentLocation) || (currentLocation && [self.currentLocation distanceFromLocation:currentLocation] > 4.f) ) {
            self.currentLocation = currentLocation;
            if([self.delegate respondsToSelector:@selector(locationChanged:)]) [self.delegate locationChanged:self.currentLocation];
        }
    }
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error { [self.delegate locationError:error]; }
#pragma mark - END of Location Manager location and heading event handlers -

#pragma mark - Auto Sleep handlers
- (void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager { [self.delegate pausedLocationUpdates]; }
- (void)locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager { [self.delegate resumedLocationUpdates]; }
#pragma mark - END of auto sleep handlers


- (void)startUpdatingLocation { [self.locationManger startUpdatingLocation];}
- (void)stopUpdatingLocation { [self.locationManger stopUpdatingLocation];}
- (CLLocation *) location { return [self.locationManger location];}

@end
