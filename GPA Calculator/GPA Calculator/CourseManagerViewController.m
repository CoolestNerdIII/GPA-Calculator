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
@property (strong, nonatomic) NSMutableArray * courses;

@end

@implementation CourseManagerViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (self.courses.count ==0) {
        //NSDictionary * tmp = [[NSDictionary alloc] initWithObjectsAndKeys:@"", @"Name", @"", "Grade", @"", @"CreditHours",  nil];
        NSDictionary *tmp = @{
          @"Name": @"",
          @"Grade": @"",
          @"CreditHours": @"",
        };
        [self.courses addObject:tmp];
    }
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
    return self.courses.count + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CourseCell";
    static NSString *InsertCellIdentifier = @"InsertCell";

    
    CourseCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *insertCell = [tableView dequeueReusableCellWithIdentifier:InsertCellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.courses.count)
        return 44;
    else
        return 117;
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == self.courses.count)
    {
        [self setEditing:YES animated:YES];
    }

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
        
            if (indexPath.row == self.courses.count) {
                return UITableViewCellEditingStyleInsert;
            }
            else{
                return UITableViewCellEditingStyleDelete;
            }
        
    }
    
    return UITableViewCellEditingStyleNone;
    
}


#pragma mark - Insert New Cell
-(void) insertNewObject
{
    
    NSDictionary *tmp = @{
                          @"Name": @"",
                          @"Grade": @"",
                          @"CreditHours": @"",
                          };
    [self.courses insertObject:tmp atIndex:0];
    

        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        
        //Update the table with the new data
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        //reload specific section animated
        NSRange range   = NSMakeRange(indexPath.section, 1);
        NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationFade];
    
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
