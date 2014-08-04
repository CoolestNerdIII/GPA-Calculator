//
//  StatsViewController.m
//  GPA Calculator
//
//  Created by Paul Wilson on 8/4/14.
//  Copyright (c) 2014 Paul Wilson. All rights reserved.
//

#import "StatsViewController.h"
#import "gradeCalculator.h"

@interface StatsViewController ()

@end

@implementation StatsViewController
@synthesize Calculator;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    Calculator = [[gradeCalculator alloc]init];
    self.gradeValue.text = [NSString stringWithFormat:@"%.2f", [Calculator Calculate:self.courses]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
