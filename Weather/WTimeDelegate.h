//
//  WTimeDelegate.h
//  Weather
//
//  Created by Andrew Charkin on 11/21/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WTimeDelegate <NSObject>
@required
-(void) adjustColorFromTime: (NSDate *) date;
@end
