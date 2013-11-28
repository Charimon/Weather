//
//  W5DayBreakdown.h
//  Weather
//
//  Created by Andrew Charkin on 11/22/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WWeatherGroup.h"

@interface W5DayBreakdown : UIView <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) WWeatherGroup *weatherGroup;
@end
