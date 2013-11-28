//
//  WClock.m
//  Weather
//
//  Created by Andrew Charkin on 11/22/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WClock.h"
#import "WConstants.h"

@interface WClock()
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UILabel *periodLabel; //AM,PM, MIDNIGHT, NOON
@property (strong, nonatomic) NSDateFormatter *timeFormater;
@property (strong, nonatomic) NSDateFormatter *periodFormater;
-(void) nextMinute;
@end

@implementation WClock

-(UILabel *) periodLabel {
    if(_periodLabel) return _periodLabel;
    _periodLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _periodLabel.backgroundColor = [UIColor clearColor];
    _periodLabel.textAlignment = NSTextAlignmentCenter;
    _periodLabel.text = @"";
    _periodLabel.font = HELVETICA_THIN(17.f);
    _periodLabel.textColor = BRIGHT;
    
    _periodLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _periodLabel;
}

-(UILabel *) timeLabel {
    if(_timeLabel) return _timeLabel;
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _timeLabel.backgroundColor = [UIColor clearColor];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    
    _timeLabel.textColor = BRIGHT;
    _timeLabel.font = HELVETICA_THIN(50.f);
    
    _timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return _timeLabel;
}

-(NSDateFormatter *) timeFormater {
    if(_timeFormater) return _timeFormater;
    _timeFormater = [[NSDateFormatter alloc] init];
    [_timeFormater setDateFormat:@"hh:mm"];
    return _timeFormater;
}

-(NSDateFormatter *) periodFormater {
    if(_periodFormater) return _periodFormater;
    _periodFormater = [[NSDateFormatter alloc] init];
    [_periodFormater setDateFormat:@"a"];
    return _periodFormater;
}

-(void) nextMinute {
    NSDate *now = [NSDate date];
    self.timeLabel.text = [self.timeFormater stringFromDate:now];
    self.periodLabel.text = [self.periodFormater stringFromDate:now];
    if([self.timeLabel.text isEqualToString:@"12:00"] && [self.periodLabel.text isEqualToString:@"AM"]) {
        self.periodLabel.text = @"MIDNIGHT";
    } else if ([self.timeLabel.text isEqualToString:@"12:00"] && [self.periodLabel.text isEqualToString:@"PM"]) {
        self.periodLabel.text = @"NOON";
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.timeLabel];
        [self addSubview:self.periodLabel];
        ACP(self, self.timeLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self, NSLayoutAttributeTop, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.timeLabel, NSLayoutAttributeLeading, NSLayoutRelationEqual, self, NSLayoutAttributeLeading, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.timeLabel, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self, NSLayoutAttributeTrailing, 1.f, 0.f, UILayoutPriorityRequired);
        
        ACP(self, self.periodLabel, NSLayoutAttributeTop, NSLayoutRelationEqual, self.timeLabel, NSLayoutAttributeBottom, 1.f, -6.f, UILayoutPriorityRequired);
        ACP(self, self.periodLabel, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.periodLabel, NSLayoutAttributeCenterX, NSLayoutRelationEqual, self.timeLabel, NSLayoutAttributeCenterX, 1.f, 0.f, UILayoutPriorityRequired);

        [self nextMinute];
        [NSTimer scheduledTimerWithTimeInterval: 1 target: self selector: @selector(nextMinute) userInfo: nil repeats: YES];

    }
    return self;
}

@end
