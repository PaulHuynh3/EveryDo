//
//  AddItemViewController.h
//  EveryDo
//
//  Created by Paul on 2017-09-19.
//  Copyright © 2017 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"
#import "Todo.h"

@protocol AddItemViewControllerDelegate <NSObject>

-(void)addObjectTodo:(Todo*)todo;

@end

@interface AddItemViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *priorityNumberTextField;



@property (strong,nonatomic) id<AddItemViewControllerDelegate>addDelegate;


@end
