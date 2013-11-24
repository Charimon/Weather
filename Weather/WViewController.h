//
//  WViewController.h
//  Weather
//
//  Created by Andrew Charkin on 11/21/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCoordinatorDelegate.h"
#import "WLocationManager.h"

@interface WViewController : UIViewController <WCoordinatorDelegate, WLocationManagerDelgate>
@end
