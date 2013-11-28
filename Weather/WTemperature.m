//
//  WTemperature.m
//  Weather
//
//  Created by Andrew Charkin on 11/22/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WTemperature.h"
#import "WConstants.h"

@interface WTemperature()
@property (strong, nonatomic) UILabel * tempLabel;
@property (strong, nonatomic) UILabel * scaleLabel;
@end

@implementation WTemperature

-(UILabel *) tempLabel {
    if(_tempLabel) return _tempLabel;
    _tempLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _tempLabel.backgroundColor = [UIColor clearColor];
    _tempLabel.font = HELVETICA_THIN(50);
    _tempLabel.textColor = TWILIGHT;
    _tempLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _tempLabel;
}

-(UILabel *) scaleLabel {
    if(_scaleLabel) return _scaleLabel;
    _scaleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _scaleLabel.backgroundColor = [UIColor clearColor];
    _scaleLabel.font = HELVETICA(20);
    _scaleLabel.textColor = TWILIGHT_A(.6f);
    _scaleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _scaleLabel;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.scaleLabel];
        [self addSubview:self.tempLabel];
        
        ACP(self, self.tempLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self, NSLayoutAttributeLeading, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.tempLabel, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0.f, UILayoutPriorityRequired);
        
        ACP(self, self.scaleLabel, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self, NSLayoutAttributeTrailing, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.scaleLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.tempLabel, NSLayoutAttributeTrailing, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.scaleLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self, NSLayoutAttributeTop, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.scaleLabel, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.tempLabel, NSLayoutAttributeTop, 1.f, 24.f, UILayoutPriorityRequired);
    }
    return self;
}

-(void) setTemperature: (NSNumber *) temperature {
    self.tempLabel.text = temperature.description;
    if(self.tempLabel.text.length > 0) self.scaleLabel.text = @"°C";
}

@end
