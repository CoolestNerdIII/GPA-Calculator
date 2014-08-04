//
//  StatsViewController.h
//  GPA Calculator
//
//  Created by Paul Wilson on 8/4/14.
//  Copyright (c) 2014 Paul Wilson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gradeCalculator.h"

@interface StatsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *gradeValue;
@property (strong, nonatomic) NSMutableArray *courses;
@property (strong, nonatomic) gradeCalculator *Calculator;
@end
