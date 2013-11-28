//
//  WWeather.m
//  Weather
//
//  Created by Andrew Charkin on 11/22/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WWeatherView.h"

@interface WWeatherView()
@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UILabel *weatherLabel;
@property (strong, nonatomic) UILabel *locationLabel;
@end

@implementation WWeatherView
-(UILabel *) weatherLabel {
    if(_weatherLabel) return _weatherLabel;
    _weatherLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _weatherLabel.font = HELVETICA_LIGHT(16);
    _weatherLabel.textColor = TWILIGHT;
    _weatherLabel.backgroundColor = [UIColor clearColor];
    _weatherLabel.numberOfLines = 0;
    _weatherLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _weatherLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _weatherLabel;
}

-(UILabel *) locationLabel {
    if(_locationLabel) return _locationLabel;
    _locationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _locationLabel.font = HELVETICA_LIGHT(12);
    _locationLabel.textColor = TWILIGHT;
    _locationLabel.backgroundColor = [UIColor clearColor];
    _locationLabel.textAlignment = NSTextAlignmentCenter;
    _locationLabel.numberOfLines = 0;
    _locationLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _locationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _locationLabel;
}

-(UIImageView *) icon {
    if(_icon) return _icon;
    _icon = [[UIImageView alloc] initWithFrame:CGRectZero];
    _icon.contentMode = UIViewContentModeCenter;
    
    _icon.translatesAutoresizingMaskIntoConstraints = NO;
    return _icon;
}

-(void) setLocation:(NSString *) location { self.locationLabel.text = location; }
-(void) setWeatherType:(WWeatherType) type {
    switch(type) {
        case WWeatherTypeSunny: self.icon.image = [UIImage imageNamed:@"sunny"];self.weatherLabel.text = @"Sunny";break;
        case WWeatherTypePartiallyCloudy: self.icon.image = [UIImage imageNamed:@"partially_cloudy"];self.weatherLabel.text = @"Partially Cloudy";break;
        case WWeatherTypeThunder: self.icon.image = [UIImage imageNamed:@"thunder"];self.weatherLabel.text = @"Thundery";break;
        default: break;
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.icon];
        [self addSubview:
         self.locationLabel];
        [self addSubview:self.weatherLabel];
        
        ACP(self, self.icon, NSLayoutAttributeLeading, NSLayoutRelationEqual, self, NSLayoutAttributeLeading, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.icon, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self, NSLayoutAttributeTrailing, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.icon, NSLayoutAttributeCenterY, NSLayoutRelationEqual, self, NSLayoutAttributeCenterY, 1.f, 0.f, UILayoutPriorityRequired);
        
        ACP(self, self.weatherLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self, NSLayoutAttributeLeading, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.weatherLabel, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self, NSLayoutAttributeTrailing, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.weatherLabel, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.icon, NSLayoutAttributeTop, 1.f, -4.f, UILayoutPriorityRequired);
        
        ACP(self, self.locationLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self, NSLayoutAttributeLeading, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.locationLabel, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self, NSLayoutAttributeTrailing, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.locationLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self.icon, NSLayoutAttributeBottom, 1.f, 0.f, UILayoutPriorityRequired);
    }
    return self;
}
@end
