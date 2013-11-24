//
//  WRestkitManager.h
//  Weather
//
//  Created by Andrew Charkin on 11/22/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface WRestkitManager : NSObject

@property (strong, nonatomic) RKObjectManager *objectManager;
+ (WRestkitManager *)sharedInstance;

@end
