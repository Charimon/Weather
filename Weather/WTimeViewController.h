//
//  WTimeViewController.h
//  Weather
//
//  Created by Andrew Charkin on 11/21/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFragmentDelegate.h"
#import "WTimeDelegate.h"

@interface WTimeViewController : UIViewController <WFragmentDelegate, WTimeDelegate>
@property (weak, nonatomic) id<WCoordinatorDelegate> coordinatorDelegate;
@end
