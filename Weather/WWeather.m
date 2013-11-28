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

- (WWeatherType) weatherType {
    NSNumber *weatherType = [[WWeather wwoCodes] objectForKey:self.weatherCode];
    return weatherType.intValue;
}

static NSDictionary *wwoCodes = nil;
+(NSDictionary*) wwoCodes
{
    if(wwoCodes) return wwoCodes;
    
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        wwoCodes = [NSDictionary dictionaryWithObjectsAndKeys:
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"395",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"392",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"389",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"386",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"377",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"374",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"371",
                 [NSNumber numberWithInt:WWeatherTypeLightSnow],@"368",
                 [NSNumber numberWithInt:WWeatherTypeModerateSleet],@"365",
                 [NSNumber numberWithInt:WWeatherTypeLightSleet],@"362",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"359",
                 [NSNumber numberWithInt:WWeatherTypeModerateRain],@"356",
                 [NSNumber numberWithInt:WWeatherTypeLightRain],@"353",
                 [NSNumber numberWithInt:WWeatherTypeHail],@"350",
                 [NSNumber numberWithInt:WWeatherTypeHeavySnow],@"338",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"335",
                 [NSNumber numberWithInt:WWeatherTypeModerateSnow],@"332",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"329",
                 [NSNumber numberWithInt:WWeatherTypeLightSnow],@"326",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"323",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"320",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"317",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"314",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"311",
                 [NSNumber numberWithInt:WWeatherTypeHeavyRain],@"308",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"305",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"299",
                 [NSNumber numberWithInt:WWeatherTypeLightRain],@"296",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"293",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"284",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"281",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"266",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"263",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"260",
                 [NSNumber numberWithInt:WWeatherTypeFog],@"248",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"230",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"227",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"200",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"185",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"182",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"179",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"176",
                 [NSNumber numberWithInt:WWeatherTypeUndefined],@"143",
                 [NSNumber numberWithInt:WWeatherTypeOvercast],@"122",
                 [NSNumber numberWithInt:WWeatherTypeCloudy],@"119",
                 [NSNumber numberWithInt:WWeatherTypePartiallyCloudy],@"116",
                 [NSNumber numberWithInt:WWeatherTypeSunny],@"113",
                 nil];
    });
    
    return wwoCodes;
}

@end
