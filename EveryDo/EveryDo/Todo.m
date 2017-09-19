//
//  Todo.m
//  EveryDo
//
//  Created by Paul on 2017-09-19.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype)initWithTitle:(NSString*)title description:(NSString*)description priorityNumber:(NSInteger)number complete:(BOOL)isCompleted{

    self = [super init];
    
    if (self){
    _title = title;
    _todoDescription = description;
    _priorityNumber = number;
    _isCompleted = isCompleted;
    }
    return self;
}




/*
 Create a custom UITableViewCell subclass that displays the title, a one-line preview of the task description, the priority level, and strikethrough text of all other text if the task is completed. This will require you to implement the delegate and data source methods to display a cell for each todo item.
 
 */


@end
