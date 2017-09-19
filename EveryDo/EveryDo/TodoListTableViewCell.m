//
//  TodoListTableViewCell.m
//  EveryDo
//
//  Created by Paul on 2017-09-19.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "TodoListTableViewCell.h"

@implementation TodoListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/* 
 Create a custom UITableViewCell subclass that displays the title, a oner-line preview of the task description, the priority level, and strikethrough text of all othe text if the task is completed. This will require you to implement the delegate and data source methods to display a cell for each todo item.
 */



@end
