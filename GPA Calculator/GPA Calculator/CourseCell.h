//
//  CourseCell.h
//  GPA Calculator
//
//  Created by Paul Wilson on 7/31/14.
//  Copyright (c) 2014 Paul Wilson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextField *courseName;
@property (strong, nonatomic) IBOutlet UITextField *courseGrade;
@property (strong, nonatomic) IBOutlet UITextField *numberOfCredits;

@end
