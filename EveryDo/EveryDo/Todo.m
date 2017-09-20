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


@end
