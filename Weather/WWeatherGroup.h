//
//  WWeatherGroup.h
//  Weather
//
//  Created by Andrew Charkin on 11/23/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WWeatherGroup : NSObject
@property (nonatomic, strong) NSArray *currentConditions;
@property (nonatomic, strong) NSArray *fiveDays;
@property (nonatomic, strong) CLPlacemark *placemark;
+ (RKObjectMapping *) responseMapping;
@end
