//
//  CourseManagerViewController.m
//  GPA Calculator
//
//  Created by Paul Wilson on 7/31/14.
//  Copyright (c) 2014 Paul Wilson. All rights reserved.
//

#import "CourseManagerViewController.h"
#import "CourseCell.h"

@interface CourseManagerViewController ()

@end

@implementation CourseManagerViewController
@synthesize courses, editMode;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    courses = [[NSMutableArray alloc] init];
    
    if (courses.count == 0) {
        NSDictionary *tmp = @{
                              @"Name": @"",
                              @"Grade": @"",
                              @"CreditHours": @"",
                              };
        
        [courses addObject:tmp];
    }
    
    editMode = FALSE;
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return courses.count + 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CourseCell";
    static NSString *InsertCellIdentifier = @"InsertCell";
    static NSString *CalculateCellIdentifier = @"CalculateCell";

    if (indexPath.row == courses.count){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:InsertCellIdentifier forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:InsertCellIdentifier];
        }
        
        return cell;
    }
    else if (indexPath.row == courses.count+1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CalculateCellIdentifier forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CalculateCellIdentifier];
        }
    
        
        return cell;
    }
    else{
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
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row >= courses.count)
        return 44;
    else
        return 117;
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == courses.count)
    {
        //[self setEditing:YES animated:YES];
        editMode = TRUE;
        NSLog(editMode ? @"Editting" : @"Not Editting");
    }
    NSLog(editMode ? @"Editting" : @"Not Editting");

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
    /*
    if (self.editing) {
        
            if (indexPath.row == courses.count) {
                return UITableViewCellEditingStyleInsert;
            }
            else{
                return UITableViewCellEditingStyleDelete;
            }
        
    }
    */
    
    if (editMode) {
        
        if (indexPath.row == courses.count) {
            return UITableViewCellEditingStyleInsert;
        }
        else if (indexPath.row == courses.count+1)
            return UITableViewCellEditingStyleNone;
        else{
            return UITableViewCellEditingStyleDelete;
        }
        
    }
    return UITableViewCellEditingStyleNone;
    
}


#pragma mark - Insert New Cell

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [courses removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        NSDictionary *tmp = @{
                              @"Name": @"",
                              @"Grade": @"",
                              @"CreditHours": @"",
                              };
        
        [courses insertObject:tmp atIndex:courses.count];
        
        
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:courses.count inSection:0];
        
        //Update the table with the new data
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [self.tableView reloadData];
        //[self setEditing:NO animated:YES];
        editMode = FALSE;

        
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
