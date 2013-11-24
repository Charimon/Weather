//
//  WCardViewController.m
//  Weather
//
//  Created by Andrew Charkin on 11/21/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WCardViewController.h"
#import "WWeatherViewController.h"
#import "WTimeViewController.h"
#import "WConstants.h"
#import "WRestkitManager.h"


@interface WCardViewController ()
@property (strong, nonatomic) WWeatherViewController* weatherController;
@property (strong, nonatomic) WTimeViewController* timeController;
@end

@implementation WCardViewController

-(void) setupWeatherViewController {
    self.weatherController = [[WWeatherViewController alloc] init];
    self.weatherController.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.weatherController.view];
    [self addChildViewController:self.weatherController];
}

-(void) setupTimeViewController {
    self.timeController = [[WTimeViewController alloc] init];
    self.timeController.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.timeController.view];
    [self addChildViewController:self.timeController];
}

-(void) setWeatherGroup:(WWeatherGroup *)weatherGroup {
    self.weatherController.weatherGroup = weatherGroup;
    _weatherGroup = weatherGroup;
}


-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if(!self.weatherController)[self setupWeatherViewController];
    if(!self.timeController)[self setupTimeViewController];
    
    ACP(self.view, self.weatherController.view, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view, NSLayoutAttributeTop, 1.f, 0.f, UILayoutPriorityRequired);
    ACP(self.view, self.weatherController.view, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view, NSLayoutAttributeLeading, 1.f, 0.f, UILayoutPriorityRequired);
    ACP(self.view, self.weatherController.view, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.view, NSLayoutAttributeBottom, 1.f, 0.f, UILayoutPriorityRequired);
    ACP(self.view, self.weatherController.view, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeCenterX, 1.f, 0.f, UILayoutPriorityRequired);
    
    ACP(self.view, self.timeController.view, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view, NSLayoutAttributeTop, 1.f, 0.f, UILayoutPriorityRequired);
    ACP(self.view, self.timeController.view, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view, NSLayoutAttributeCenterX, 1.f, 0.f, UILayoutPriorityRequired);
    ACP(self.view, self.timeController.view, NSLayoutAttributeBottom, NSLayoutRelationEqual, self.view, NSLayoutAttributeBottom, 1.f, 0.f, UILayoutPriorityRequired);
    ACP(self.view, self.timeController.view, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeTrailing, 1.f, 0.f, UILayoutPriorityRequired);
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewDidLoad{ [super viewDidLoad];}
- (void)didReceiveMemoryWarning{ [super didReceiveMemoryWarning];}

@end
