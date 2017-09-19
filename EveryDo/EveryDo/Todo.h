//
//  Todo.h
//  EveryDo
//
//  Created by Paul on 2017-09-19.
//  Copyright © 2017 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic,strong) NSString* title;
@property (nonatomic,strong) NSString* todoDescription;
@property (nonatomic) NSInteger priorityNumber;
@property (nonatomic) BOOL isCompleted;

-(instancetype)initWithTitle:(NSString*)title description:(NSString*)description priorityNumber:(NSInteger)number complete:(BOOL)isCompleted;

                 


@end
