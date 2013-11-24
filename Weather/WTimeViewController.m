//
//  WTimeViewController.m
//  Weather
//
//  Created by Andrew Charkin on 11/21/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WTimeViewController.h"
#import "WConstants.h"
#import "WClock.h"

@interface WTimeViewController ()
@property (strong, nonatomic) WClock *clock;
@end

@implementation WTimeViewController

- (WClock *) clock {
    if(_clock) return _clock;
    _clock = [[WClock alloc] initWithFrame:CGRectZero];
    _clock.translatesAutoresizingMaskIntoConstraints = NO;
    return _clock;
}

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = TWILIGHT;
    [self.view addSubview:self.clock];
    
    ACP(self.view, self.clock, NSLayoutAttributeCenterY, NSLayoutRelationEqual, self.view, NSLayoutAttributeCenterY, 1.f, 0.f, UILayoutPriorityRequired);
    ACP(self.view, self.clock, NSLayoutAttributeCenterX, NSLayoutRelationEqual, self.view, NSLayoutAttributeCenterX, 1.f, 0.f, UILayoutPriorityRequired);
}
- (void)viewDidLoad{ [super viewDidLoad];}
- (void)didReceiveMemoryWarning{ [super didReceiveMemoryWarning];}

#pragma mark - WTimeDelegate
-(void) adjustColorFromTime: (NSDate *) date {
    
}

@end
