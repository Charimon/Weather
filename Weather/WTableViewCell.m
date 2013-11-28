//
//  WTableViewCell.m
//  Weather
//
//  Created by Andrew Charkin on 11/28/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WTableViewCell.h"
#import "WConstants.h"

@interface WTableViewCell()
@property (strong, nonatomic) NSDateFormatter *dateFormater;
@end

@implementation WTableViewCell

-(NSDateFormatter *) dateFormater {
    if(_dateFormater) return _dateFormater;
    _dateFormater = [[NSDateFormatter alloc] init];
    [_dateFormater setDateFormat:@"E"];
    return _dateFormater;
}

-(UIImageView *) iconView {
    if(_iconView) return _iconView;
    _iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _iconView.contentMode = UIViewContentModeScaleAspectFit;
    _iconView.translatesAutoresizingMaskIntoConstraints = NO;
    [_iconView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [_iconView setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    return _iconView;
}

-(UILabel *) dayLabel {
    if(_dayLabel) return _dayLabel;
    _dayLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _dayLabel.backgroundColor = [UIColor clearColor];
    _dayLabel.font = HELVETICA_LIGHT(40.f);
    _dayLabel.textColor = TWILIGHT;
    _dayLabel.textAlignment = NSTextAlignmentCenter;
    _dayLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _dayLabel;
}

-(UILabel *) minTempLabel {
    if(_minTempLabel) return _minTempLabel;
    _minTempLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _minTempLabel.backgroundColor = [UIColor clearColor];
    _minTempLabel.font = HELVETICA_LIGHT(17.f);
    _minTempLabel.textColor = TWILIGHT_A(.6f);
    _minTempLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _minTempLabel;
}

-(UILabel *) maxTempLabel {
    if(_maxTempLabel) return _maxTempLabel;
    _maxTempLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _maxTempLabel.backgroundColor = [UIColor clearColor];
    _maxTempLabel.font = HELVETICA_LIGHT(24.f);
    _maxTempLabel.textColor = TWILIGHT;
    _maxTempLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _maxTempLabel;
}

-(void) setupWithWeather: (WWeather *) weather {
    self.dayLabel.text = [[self.dateFormater stringFromDate:weather.date] substringToIndex:1];
    self.minTempLabel.text = weather.minTemperature.description;
    self.maxTempLabel.text = weather.maxTemperature.description;
    
    switch(weather.weatherType) {
        case WWeatherTypeSunny: self.iconView.image = [UIImage imageNamed:@"sunny"];break;
        case WWeatherTypePartiallyCloudy: self.iconView.image = [UIImage imageNamed:@"partially_cloudy"];break;
        case WWeatherTypeThunder: self.iconView.image = [UIImage imageNamed:@"thunder"];break;
        default: break;
    }
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.dayLabel];
        [self.contentView addSubview:self.maxTempLabel];
        [self.contentView addSubview:self.minTempLabel];
        
        ACP(self.contentView, self.dayLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeLeading, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self.contentView, self.dayLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeTop, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self.contentView, self.dayLabel, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeBottom, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self.contentView, self.dayLabel, NSLayoutAttributeWidth, NSLayoutRelationGreaterThanOrEqual, nil, NSLayoutAttributeNotAnAttribute, 0.f, 46.f, UILayoutPriorityRequired);
        
        ACP(self.contentView, self.minTempLabel, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeTrailing, 1.f, -4.f, UILayoutPriorityRequired);
        ACP(self.contentView, self.minTempLabel, NSLayoutAttributeCenterY, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeCenterY, 1.f, 8.f, UILayoutPriorityRequired);
        
        ACP(self.contentView, self.maxTempLabel, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.minTempLabel, NSLayoutAttributeLeading, 1.f, -4.f, UILayoutPriorityRequired);
        ACP(self.contentView, self.maxTempLabel, NSLayoutAttributeCenterY, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeCenterY, 1.f, 6.f, UILayoutPriorityRequired);
        
        ACP(self.contentView, self.iconView, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.dayLabel, NSLayoutAttributeTrailing, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self.contentView, self.iconView, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.maxTempLabel, NSLayoutAttributeLeading, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self.contentView, self.iconView, NSLayoutAttributeTop, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeTop, 1.f, 15.f, UILayoutPriorityRequired);
        ACP(self.contentView, self.iconView, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.contentView, NSLayoutAttributeBottom, 1.f, -15.f, UILayoutPriorityRequired);
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
