//
//  WCurrentDayWeather.m
//  Weather
//
//  Created by Andrew Charkin on 11/22/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WCurrentDayWeather.h"
#import "WTemperature.h"
#import "WWeatherView.h"
#import "WWeather.h"
#import "WConstants.h"

@interface WCurrentDayWeather()
@property (strong, nonatomic) WTemperature* highTemperature;
@property (strong, nonatomic) WTemperature* lowTemperature;
@property (strong, nonatomic) WWeatherView* weatherView;
@end

@implementation WCurrentDayWeather

-(WWeatherView *) weatherView {
    if(_weatherView) return _weatherView;
    _weatherView = [[WWeatherView alloc] initWithFrame:CGRectZero];
    _weatherView.translatesAutoresizingMaskIntoConstraints = NO;
    return _weatherView;
}

-(WTemperature *) highTemperature {
    if(_highTemperature) return _highTemperature;
    _highTemperature = [[WTemperature alloc] initWithFrame:CGRectZero];
    _highTemperature.translatesAutoresizingMaskIntoConstraints = NO;
    return _highTemperature;
}

-(WTemperature *) lowTemperature {
    if(_lowTemperature) return _lowTemperature;
    _lowTemperature = [[WTemperature alloc] initWithFrame:CGRectZero];
    _lowTemperature.translatesAutoresizingMaskIntoConstraints = NO;
    return _lowTemperature;
}

-(void) setWeatherGroup:(WWeatherGroup *)weatherGroup {
    _weatherGroup = weatherGroup;
    WWeather *weather = [weatherGroup.fiveDays objectAtIndex:0];
    [self.highTemperature setTemperature:weather.maxTemperature];
    [self.lowTemperature setTemperature:weather.minTemperature];
    [self.weatherView setLocation:weatherGroup.placemark.locality];
    [self.weatherView setWeatherType:[weather weatherType]];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.highTemperature];
        [self addSubview:self.lowTemperature];
        [self addSubview:self.weatherView];
        
        
        ACP(self, self.highTemperature, NSLayoutAttributeCenterX, NSLayoutRelationEqual, self, NSLayoutAttributeCenterX, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.highTemperature, NSLayoutAttributeCenterY, NSLayoutRelationEqual, self, NSLayoutAttributeCenterY, .35f, 0.f, UILayoutPriorityRequired);
        
        ACP(self, self.lowTemperature, NSLayoutAttributeCenterX, NSLayoutRelationEqual, self, NSLayoutAttributeCenterX, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.lowTemperature, NSLayoutAttributeCenterY, NSLayoutRelationEqual, self, NSLayoutAttributeCenterY, 1.65f, 0.f, UILayoutPriorityRequired);
        
        ACP(self, self.weatherView, NSLayoutAttributeCenterY, NSLayoutRelationEqual, self, NSLayoutAttributeCenterY, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.weatherView, NSLayoutAttributeLeading, NSLayoutRelationEqual, self, NSLayoutAttributeLeading, 1.f, 30.f, UILayoutPriorityRequired);
        ACP(self, self.weatherView, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self, NSLayoutAttributeTrailing, 1.f, -30.f, UILayoutPriorityRequired);
    }
    return self;
}

@end
