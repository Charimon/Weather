//
//  WConstants.h
//  Weather
//
//  Created by Andrew Charkin on 11/21/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <Foundation/Foundation.h>
//DISTANCE
//-------------------------
#define LOCATION_DISTANCE (1609.34f*5.f)

//RESTKIT STUFF
//-------------------------
//world weather online
#define WWO_API_TOKEN @"453g2eef8xpw936sckt7fj64"
#define WWO_SERVER_URL_STR @"http://api.worldweatheronline.com"
#define WWO_LOCAL_WEATHER_URL @"/free/v1/weather.ashx"


//COLORS
//-------------------------
//F1F0EC
#define BRIGHT_A(a) ([UIColor colorWithRed:241.f/255.f green:240.f/255.f blue:236.f/255.f alpha:(a)])
#define BRIGHT BRIGHT_A(1.f)
//030325
#define TWILIGHT_A(a) ([UIColor colorWithRed:3.f/255.f green:4.f/255.f blue:38.f/255.f alpha:a])
#define TWILIGHT TWILIGHT_A(1.f)


//FONTS
//-------------------------
#define HELVETICA(s) ([UIFont fontWithName:@"HelveticaNeue" size:(s)])
#define HELVETICA_LIGHT(s) ([UIFont fontWithName:@"HelveticaNeue-Light" size:(s)])
#define HELVETICA_THIN(s) ([UIFont fontWithName:@"HelveticaNeue-Thin" size:(s)])
#define HELVETICA_ULTRALIGHT(s) ([UIFont fontWithName:@"HelveticaNeue-UltraLight" size:(s)])


//CONSTRAINT shorthand
//-------------------------
#define ACP(v, i1, a1, r, i2, a2, m, c, p)\
{NSLayoutConstraint *cnst = [NSLayoutConstraint constraintWithItem:i1 attribute:a1 relatedBy:r toItem:i2 attribute: a2 multiplier:m constant:c];\
cnst.priority = p;\
[v addConstraint: cnst];}

#define REMOVE_CONST_FROM(what, from)\
{for(NSLayoutConstraint *c in from.constraints) {\
if(c.firstItem == what) [from removeConstraint:c];\
}}

#define REMOVE_CONST(what)\
REMOVE_CONST_FROM(what, what.superview)


//enums
//-------------------------
typedef NS_ENUM(NSInteger, WWeatherType) {
    WWeatherTypeUndefined,
    WWeatherTypeSunny,
    
    WWeatherTypeCloudy,
    WWeatherTypePartiallyCloudy,
    WWeatherTypeLightlyCloudy,
    WWeatherTypeMostlyCloudy,
    WWeatherTypeOvercast,
    
    WWeatherTypeFog,
    
    WWeatherTypeScatteredRain,
    WWeatherTypeRain,
    WWeatherTypeLightRain,
    WWeatherTypeModerateRain,
    WWeatherTypeHeavyRain,
    
    WWeatherTypeScatteredSnow,
    WWeatherTypeSnow,
    WWeatherTypeLightSnow,
    WWeatherTypeModerateSnow,
    WWeatherTypeHeavySnow,
    
    WWeatherTypeScatteredSleet,
    WWeatherTypeSleet,
    WWeatherTypeLightSleet,
    WWeatherTypeModerateSleet,
    WWeatherTypeHeavySleet,
    
    WWeatherTypeScatteredThunder,
    WWeatherTypeThunder,
    WWeatherTypeLightThunder,
    WWeatherTypeModerateThunder,
    WWeatherTypeHeavyThunder,
    
    WWeatherTypeScatteredHail,
    WWeatherTypeHail,
    WWeatherTypeLightHail,
    WWeatherTypeModerateHail,
    WWeatherTypeHeavyHail,
};
