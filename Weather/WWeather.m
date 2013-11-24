//
//  WWeather.m
//  Weather
//
//  Created by Andrew Charkin on 11/23/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WWeather.h"

@implementation WWeather
+ (RKObjectMapping *) responseMapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[WWeather class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"cloudcover" : @"cloudCover",
                                                  @"humidity" : @"humidity",
                                                  @"observation_time" : @"observationTime",
                                                  @"precipMM" : @"precipitation",
                                                  @"pressure" : @"pressure",
                                                  @"temp_C" : @"temperature",
                                                  @"visibility" : @"visibility",
                                                  @"weatherCode" : @"weatherCode",
                                                  @"winddir16Point" : @"windDirection",
                                                  @"winddirDegree" : @"windDirectionAngleInDegrees",
                                                  @"windspeedKmph" : @"windSpeedKMPH",
                                                  @"date" : @"date",
                                                  @"tempMaxC" : @"maxTemperature",
                                                  @"tempMinC" : @"minTemperature",
                                                  }];
    return mapping;
}
@end
