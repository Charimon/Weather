//
//  WWeatherControllerViewController.m
//  Weather
//
//  Created by Andrew Charkin on 11/21/13.
//  Copyright (c) 2013 Charimon. All rights reserved.
//

#import "WWeatherViewController.h"
#import "WConstants.h"
#import "WCurrentDayWeather.h"
#import "W5DayBreakdown.h"

@interface WWeatherViewController ()
@property (strong, nonatomic) WCurrentDayWeather* currentDayWeather;
@property (strong, nonatomic) W5DayBreakdown* fiveDayBreakdown;
@property (nonatomic, strong) UIPanGestureRecognizer* gestureRecognizer;
-(void) handlePanFrom: (UIPanGestureRecognizer *)recognizer;
@end

@implementation WWeatherViewController
-(void) setupGestureRecognizer {
    self.gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanFrom:)];
    [self.view addGestureRecognizer:self.gestureRecognizer];
}

-(void) setupCurrentDayWeather {
    self.currentDayWeather = [[WCurrentDayWeather alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.currentDayWeather];
    self.currentDayWeather.translatesAutoresizingMaskIntoConstraints = NO;
}

-(void) setupFiveDayBreakdown {
    self.fiveDayBreakdown = [[W5DayBreakdown alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.fiveDayBreakdown];
    self.fiveDayBreakdown.translatesAutoresizingMaskIntoConstraints = NO;
}

-(void) setWeatherGroup:(WWeatherGroup *)weatherGroup {
    _weatherGroup = weatherGroup;
    self.currentDayWeather.weatherGroup = weatherGroup;
    self.fiveDayBreakdown.weatherGroup = weatherGroup;
}

-(void) handlePanFrom: (UIPanGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan){
        if(!self.fiveDayBreakdown){
            [self setupFiveDayBreakdown];
            ACP(self.view, self.fiveDayBreakdown, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view, NSLayoutAttributeLeading, 1.f, 0.f, UILayoutPriorityRequired);
            ACP(self.view, self.fiveDayBreakdown, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeTrailing, 1.f, 0.f, UILayoutPriorityRequired);
            ACP(self.view, self.fiveDayBreakdown, NSLayoutAttributeTop, NSLayoutRelationEqual, self.currentDayWeather, NSLayoutAttributeBottom, 1.f, 0.f, UILayoutPriorityRequired);
            ACP(self.view, self.fiveDayBreakdown, NSLayoutAttributeHeight, NSLayoutRelationEqual, self.view, NSLayoutAttributeHeight, 1.f, 0.f, UILayoutPriorityRequired);
        }
    } else if(recognizer.state == UIGestureRecognizerStateChanged){
        CGPoint translation = [recognizer translationInView:recognizer.view];
        NSLog(@"%f", translation.y);
        if(translation.y > 0) return;
        
        for(NSLayoutConstraint *constraint in self.view.constraints) {
            if(constraint.firstItem == self.currentDayWeather && constraint.firstAttribute == NSLayoutAttributeTop) {
                constraint.constant = translation.y;
            }
        }
        [self.view layoutIfNeeded];
    } else if(recognizer.state == UIGestureRecognizerStateEnded){
        CGPoint translation = [recognizer translationInView:recognizer.view];
        CGPoint velocity = [recognizer velocityInView:recognizer.view];
        
        CGFloat animationConversion;
        UIViewAnimationOptions transition;
        CGFloat distance;
        CGFloat height = self.view.frame.size.height;
        //if past the 1/4 point open it
        if(-translation.y > height/4){
            distance = ABS(height + translation.y);
            animationConversion = (distance/height);
            transition = UIViewAnimationOptionTransitionNone | UIViewAnimationOptionCurveEaseInOut;
            translation.y = -height;
        } else if (translation.y > height/4){
            distance = ABS(height - translation.y);
            animationConversion = (distance/height);
            transition = UIViewAnimationOptionTransitionNone | UIViewAnimationOptionCurveEaseInOut;
        } else {
            distance = ABS(translation.y);
            animationConversion = (distance/height);
            transition = UIViewAnimationOptionTransitionNone | UIViewAnimationOptionCurveEaseInOut;
            translation.y = 0;
        }
        if(distance/ABS(velocity.x) < animationConversion) animationConversion = distance/ABS(velocity.y);
        
        for(NSLayoutConstraint *constraint in self.view.constraints) {
            if(constraint.firstItem == self.currentDayWeather && constraint.firstAttribute == NSLayoutAttributeTop) {
                constraint.constant = translation.y;
            }
        }
        
        [UIView animateWithDuration:animationConversion
                              delay:0
                            options:transition
                         animations:^{
                             [self.view layoutIfNeeded];
                         } completion:^(BOOL finished){
                             
                         }];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = BRIGHT;
    if(!self.currentDayWeather) [self setupCurrentDayWeather];
    ACP(self.view, self.currentDayWeather, NSLayoutAttributeLeading, NSLayoutRelationEqual, self.view, NSLayoutAttributeLeading, 1.f, 0.f, UILayoutPriorityRequired);
    ACP(self.view, self.currentDayWeather, NSLayoutAttributeTrailing, NSLayoutRelationEqual, self.view, NSLayoutAttributeTrailing, 1.f, 0.f, UILayoutPriorityRequired);
    ACP(self.view, self.currentDayWeather, NSLayoutAttributeTop, NSLayoutRelationEqual, self.view, NSLayoutAttributeTop, 1.f, 0.f, UILayoutPriorityRequired);
    ACP(self.view, self.currentDayWeather, NSLayoutAttributeHeight, NSLayoutRelationEqual, self.view, NSLayoutAttributeHeight, 1.f, 0.f, UILayoutPriorityRequired);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setupGestureRecognizer];
}
- (void)viewDidLoad{ [super viewDidLoad];}
- (void)didReceiveMemoryWarning{ [super didReceiveMemoryWarning];}

@end
