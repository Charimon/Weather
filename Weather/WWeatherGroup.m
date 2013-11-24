//
//  WWeatherGroup.m
//  Weather
//
//  Created by Andrew Charkin on 11/23/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WWeatherGroup.h"
#import "WWeather.h"

@implementation WWeatherGroup
+ (RKObjectMapping *) responseMapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[WWeatherGroup class]];
    
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"current_condition" toKeyPath:@"currentConditions" withMapping:[WWeather responseMapping]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"weather" toKeyPath:@"fiveDays" withMapping:[WWeather responseMapping]]];
    
    return mapping;
}
@end
