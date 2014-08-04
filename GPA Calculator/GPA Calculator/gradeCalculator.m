//
//  gradeCalculator.m
//  GPA Calculator
//
//  Created by Paul Wilson on 7/31/14.
//  Copyright (c) 2014 Paul Wilson. All rights reserved.
//

#import "gradeCalculator.h"

@interface gradeCalculator()

@end

@implementation gradeCalculator


-(double)Calculate:(NSMutableArray *) values{
    double gpa = 0.0;
    int totalCredits = 0;
    double totalPoints = 0;
    
    double gradePoints;
    int credits;
    
    if (values.count == 0)
        return 0;
    
    NSDictionary * value;
    
    for (value in values) {
        credits = [[value objectForKey:@"CreditHours"] intValue];
        totalCredits = totalCredits + credits;
        gradePoints =credits * [self getPoints:[value objectForKey:@"Grade"]];
        totalPoints += gradePoints;
    
    }
    gpa = totalPoints / totalCredits;
    
    
//    cell.courseName.text = [tmp objectForKey:@"Name"];
//    cell.courseGrade.text = [tmp objectForKey:@"Grade"];
//    cell.numberOfCredits.text = [tmp objectForKey:@"CreditHours"];
    return gpa;
}

-(double) getPoints:(NSString *) letterGrade{
    
    double points = 0.0;

    if ([letterGrade isEqualToString:@"A"] || [letterGrade isEqualToString:@"a"])
         points = 4.0;
    else if([letterGrade isEqualToString:@"A-"] || [letterGrade isEqualToString:@"a-"])
        points = 3.7;
    else if([letterGrade isEqualToString:@"B+"] || [letterGrade isEqualToString:@"b+"])
        points = 3.3;
    else if([letterGrade isEqualToString:@"B"] || [letterGrade isEqualToString:@"b"])
        points = 3.0;
    else if([letterGrade isEqualToString:@"B-"] || [letterGrade isEqualToString:@"b-"])
        points = 2.7;
    else if([letterGrade isEqualToString:@"C+"] || [letterGrade isEqualToString:@"c+"])
        points = 2.3;
    else if([letterGrade isEqualToString:@"C"] || [letterGrade isEqualToString:@"c"])
        points = 2.0;
    else if([letterGrade isEqualToString:@"C-"] || [letterGrade isEqualToString:@"c-"])
        points = 1.7;
    else if([letterGrade isEqualToString:@"D+"] || [letterGrade isEqualToString:@"d+"])
        points = 1.3;
    else if([letterGrade isEqualToString:@"D"] || [letterGrade isEqualToString:@"d"])
        points = 1.0;
    else if([letterGrade isEqualToString:@"D-"] || [letterGrade isEqualToString:@"d-"])
        points = 0.7;
    
    return points;
}

@end
