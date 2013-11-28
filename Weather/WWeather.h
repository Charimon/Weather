//
//  WWeather.h
//  Weather
//
//  Created by Andrew Charkin on 11/23/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "WConstants.h"

@interface WWeather : NSObject
@property (nonatomic, strong) NSString *cloudCover;
@property (nonatomic, strong) NSNumber *humidity;
@property (nonatomic, strong) NSString *observationTime;
@property (nonatomic, strong) NSNumber *precipitation;
@property (nonatomic, strong) NSNumber *pressure;
@property (nonatomic, strong) NSNumber *temperature;
@property (nonatomic, strong) NSNumber *visibility;
@property (nonatomic, strong) NSString *weatherCode;
@property (nonatomic, strong) NSString *windDirection;
@property (nonatomic, strong) NSNumber *windDirectionAngleInDegrees;
@property (nonatomic, strong) NSNumber *windSpeedKMPH;

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSNumber *maxTemperature;
@property (nonatomic, strong) NSNumber *minTemperature;
- (WWeatherType) weatherType;

+ (RKObjectMapping *) responseMapping;
@end
