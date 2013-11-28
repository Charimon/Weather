//
//  WWeather.h
//  Weather
//
//  Created by Andrew Charkin on 11/22/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WConstants.h"

@interface WWeatherView : UIView
-(void) setLocation:(NSString *) location;
-(void) setWeatherType:(WWeatherType) type;
@end
