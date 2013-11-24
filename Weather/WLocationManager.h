//
//  WLocationManager.h
//  Weather
//
//  Created by Andrew Charkin on 11/23/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol WLocationManagerDelgate<NSObject>
@optional
//only callback if location is different
- (void)locationChanged:(CLLocation *)location;
@required
- (void)locationUpdate:(NSArray *)locations;
- (void)locationError:(NSError *)error;

- (void)pausedLocationUpdates;
- (void)resumedLocationUpdates;

@end

@interface WLocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, assign) id<WLocationManagerDelgate> delegate;

- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;

- (CLLocation *)location;

@end
