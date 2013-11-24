//
//  WFragmentDelegate.h
//  Weather
//
//  Created by Andrew Charkin on 11/21/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WCoordinatorDelegate.h"

@protocol WFragmentDelegate <NSObject>
@required
@property (weak, nonatomic) id<WCoordinatorDelegate> coordinatorDelegate;

@end
