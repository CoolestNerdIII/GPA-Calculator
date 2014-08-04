//
//  HomeViewController.m
//  GPA Calculator
//
//  Created by Paul Wilson on 7/31/14.
//  Copyright (c) 2014 Paul Wilson. All rights reserved.
//

#import "HomeViewController.h"
#import "CourseManagerViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize courses;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    courses = [[NSMutableArray alloc] init];
    
    if (courses.count == 0) {
        NSDictionary *tmp = @{
                              @"Name": @"",
                              @"Grade": @"",
                              @"CreditHours": @"",
                              @"GradePoints": @"",
                              };
        
        [courses addObject:tmp];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"calculateSegue"]) {
        CourseManagerViewController *detailViewController = segue.destinationViewController;
        detailViewController.courses = courses;
    }
}


@end
