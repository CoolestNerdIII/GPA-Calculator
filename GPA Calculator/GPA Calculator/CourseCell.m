//
//  CourseCell.m
//  GPA Calculator
//
//  Created by Paul Wilson on 7/31/14.
//  Copyright (c) 2014 Paul Wilson. All rights reserved.
//

#import "CourseCell.h"

@implementation CourseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
