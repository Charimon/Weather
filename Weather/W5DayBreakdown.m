//
//  W5DayBreakdown.m
//  Weather
//
//  Created by Andrew Charkin on 11/22/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "W5DayBreakdown.h"
#import "WConstants.h"
#import "WWeather.h"
#import "WTableViewCell.h"

@interface W5DayBreakdown()
@property (strong, nonatomic) UILabel *cityView;
@property (strong, nonatomic) UITableView *fiveDaysView;
@end

@implementation W5DayBreakdown
-(UIView *) cityView {
    if(_cityView) return _cityView;
    _cityView = [[UILabel alloc] initWithFrame:CGRectZero];
    _cityView.font = HELVETICA_LIGHT(16.f);
    _cityView.textColor = TWILIGHT;
    _cityView.translatesAutoresizingMaskIntoConstraints = NO;
    return _cityView;
}

-(UITableView *) fiveDaysView {
    if(_fiveDaysView) return _fiveDaysView;
    _fiveDaysView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [_fiveDaysView registerClass:[WTableViewCell class] forCellReuseIdentifier:@"CELL"];
    _fiveDaysView.delegate = self;
    _fiveDaysView.dataSource = self;
    _fiveDaysView.scrollEnabled = NO;
    _fiveDaysView.separatorInset = UIEdgeInsetsZero;
    _fiveDaysView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _fiveDaysView.translatesAutoresizingMaskIntoConstraints = NO;
    _fiveDaysView.backgroundColor = [UIColor clearColor];
    return _fiveDaysView;
}

-(void) setWeatherGroup:(WWeatherGroup *)weatherGroup {
    _weatherGroup = weatherGroup;
    self.cityView.text = weatherGroup.placemark.locality;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.cityView];
        [self addSubview:self.fiveDaysView];
        
        ACP(self, self.cityView, NSLayoutAttributeTop, NSLayoutRelationEqual, self, NSLayoutAttributeTop, 1.f, 6.f, UILayoutPriorityRequired);
        ACP(self, self.cityView, NSLayoutAttributeLeading, NSLayoutRelationEqual, self, NSLayoutAttributeLeading, 1.f, 4.f, UILayoutPriorityRequired);
        ACP(self, self.cityView, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self, NSLayoutAttributeTrailing, 1.f, 4.f, UILayoutPriorityRequired);
        
        ACP(self, self.fiveDaysView, NSLayoutAttributeTop, NSLayoutRelationEqual, self.cityView, NSLayoutAttributeBottom, 1.f, 6.f, UILayoutPriorityRequired);
        ACP(self, self.fiveDaysView, NSLayoutAttributeBottom, NSLayoutRelationEqual, self, NSLayoutAttributeBottom, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.fiveDaysView, NSLayoutAttributeLeading, NSLayoutRelationEqual, self, NSLayoutAttributeLeading, 1.f, 0.f, UILayoutPriorityRequired);
        ACP(self, self.fiveDaysView, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self, NSLayoutAttributeTrailing, 1.f, 0.f, UILayoutPriorityRequired);
    }
    return self;
}

#pragma mark - HHMenuTableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return 1; }
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weatherGroup.fiveDays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    [cell setupWithWeather:[self.weatherGroup.fiveDays objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - HHMenuTableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath { return 70.f; }

@end
