//
//  WWeatherParameters.m
//  Weather
//
//  Created by Andrew Charkin on 11/23/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WWeatherParameters.h"
#import "WConstants.h"

@implementation WWeatherParameters

-(WWeatherParameters *)initWithQuery:(NSString *)query {
    if(!query) return nil;
    if(self = [super init]) { _query = query;}
    return self;
}

-(NSDictionary *)toDictionary {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    [data setObject:self.query forKey:@"q"];
    [data setObject:@"json" forKey:@"format"];
    [data setObject:@"5" forKey:@"num_of_days"];
    [data setObject:WWO_API_TOKEN forKey:@"key"];
    return data;
}

@end
