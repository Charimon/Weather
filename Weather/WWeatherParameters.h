//
//  WWeatherParameters.h
//  Weather
//
//  Created by Andrew Charkin on 11/23/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface WWeatherParameters : NSObject
@property (nonatomic, strong, readonly) NSString *query;
-(NSDictionary *)toDictionary;

-(WWeatherParameters *)initWithQuery:(NSString *)query;
@end
