//
//  CourseManagerViewController.m
//  GPA Calculator
//
//  Created by Paul Wilson on 7/31/14.
//  Copyright (c) 2014 Paul Wilson. All rights reserved.
//

#import "CourseManagerViewController.h"
#import "CourseCell.h"
#import "StatsViewController.h"

@interface CourseManagerViewController ()

@end

@implementation CourseManagerViewController
@synthesize courses;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    if (courses.count == 0) {
        NSDictionary *tmp = @{
                              @"Name": @"",
                              @"Grade": @"",
                              @"CreditHours": @"",
                              @"GradePoints": @"",
                              };
        
        [courses insertObject:tmp atIndex:0];
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) saveInformation
{
    NSArray *cells = [self.tableView visibleCells];
    
    NSString *name;
    NSString *grade;
    NSString *numCredits;
    NSUInteger index = 0;
    
    for (CourseCell *cell in cells) {
        if ([cell class] ==[CourseCell class]) {
            
            name = [[cell courseName] text];
            grade = [[cell courseGrade] text];
            numCredits = [[cell numberOfCredits] text];
            
            NSDictionary *tmp = @{
                                  @"Name": name,
                                  @"Grade": grade,
                                  @"CreditHours": numCredits,
                                  };
            
            [courses removeObjectAtIndex:index];
            [courses insertObject:tmp atIndex:index];
            
            index++;
        }
        else
            break;
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0)
        return courses.count;
    else if (section == 1)
        return  2;
    else
        return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        static NSString *CellIdentifier = @"CourseCell";

        CourseCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[CourseCell alloc]init];
            
        }
        
        NSDictionary *tmp = [courses objectAtIndex:indexPath.row];
        cell.courseName.text = [tmp objectForKey:@"Name"];
        cell.courseGrade.text = [tmp objectForKey:@"Grade"];
        cell.numberOfCredits.text = [tmp objectForKey:@"CreditHours"];
        return cell;
    }
    else if (indexPath.section == 1){
        
        if (indexPath.row == 0) {
            static NSString *InsertCellIdentifier = @"InsertCell";

            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InsertCell" forIndexPath:indexPath];
            
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:InsertCellIdentifier];
            }
            
            return cell;
        }
        else if (indexPath.row == 1){
            static NSString *CalculateCellIdentifier = @"CalculateCell";

            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CalculateCellIdentifier forIndexPath:indexPath];
            
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CalculateCellIdentifier];
            }
            
            
            return cell;
        }
        
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1)
        return 44;
    else
        return 117;
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"Button pressed at section %ld and row %ld", (long)indexPath.section, (long)indexPath.row);
    if (indexPath.section == 1 && indexPath.row == 0)
    {
        NSLog(@"Button Pressed");
        [self setEditing:YES animated:YES];
        //        editMode = TRUE;
        //        NSLog(editMode ? @"Editting" : @"Not Editting");
    }
    //    NSLog(editMode ? @"Editting" : @"Not Editting");
    
}

#pragma mark - Table View Editting

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.editing) {
        
        if (indexPath.section == 1 && indexPath.row == 0) {
            return UITableViewCellEditingStyleInsert;
        }
        else{
            //return UITableViewCellEditingStyleDelete;
            return UITableViewCellEditingStyleNone;
        }
        
    }
    
    return UITableViewCellEditingStyleNone;
    
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 && indexPath.row == 0) {
        return YES;
    }
    return NO;
}


#pragma mark - Insert New Cell

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        //[courses removeObjectAtIndex:indexPath.row];
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSLog(@"Preparing to insert.");
        [self saveInformation];
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        NSDictionary *tmp = @{
                              @"Name": @"",
                              @"Grade": @"",
                              @"CreditHours": @"",
                              @"GradePoints": @"",
                              };
        
        [courses insertObject:tmp atIndex:courses.count];
        
        //Add to the end of the array and the end of table in that section
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:courses.count-1 inSection:0];
        
        //Update the table with the new data
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [self.tableView reloadData];
        [self setEditing:NO animated:YES];
        //editMode = FALSE;
        
        
    }
}


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"statsSegue"]) {
        
        [self saveInformation];
        StatsViewController *detailViewController = segue.destinationViewController;
        detailViewController.courses = courses;
    }
}


@end
