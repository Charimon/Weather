//
//  WWeatherControllerViewController.h
//  Weather
//
//  Created by Andrew Charkin on 11/21/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFragmentDelegate.h"
#import "WCoordinatorDelegate.h"
#import "WWeatherGroup.h"

@interface WWeatherViewController : UIViewController <WFragmentDelegate>
@property (weak, nonatomic) id<WCoordinatorDelegate> coordinatorDelegate;
@property (weak, nonatomic) WWeatherGroup *weatherGroup;
@end
