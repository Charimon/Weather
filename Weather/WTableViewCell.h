//
//  WTableViewCell.h
//  Weather
//
//  Created by Andrew Charkin on 11/28/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WWeather.h"

@interface WTableViewCell : UITableViewCell
@property (strong, nonatomic) UILabel *dayLabel;
@property (strong, nonatomic) UIImageView *iconView;
@property (strong, nonatomic) UILabel *maxTempLabel;
@property (strong, nonatomic) UILabel *minTempLabel;

-(void) setupWithWeather: (WWeather *) weather;
@end
