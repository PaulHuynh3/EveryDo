//
//  AddItemViewController.m
//  EveryDo
//
//  Created by Paul on 2017-09-19.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:true completion:nil];
}



- (IBAction)save:(UIBarButtonItem *)sender {
    
    //converting the textfield into intvalue.
    NSInteger number = self.priorityNumberTextField.text.intValue;
    
    Todo *addnewObject = [[Todo alloc]initWithTitle:self.titleTextField.text description:self.textField.text priorityNumber:number complete:NO];
    
    [self.addDelegate addObjectTodo:addnewObject];
    
    [self dismissViewControllerAnimated:true completion:nil];
}



@end
