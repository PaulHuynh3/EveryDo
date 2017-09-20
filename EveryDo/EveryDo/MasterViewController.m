//
//  MasterViewController.m
//  EveryDo
//
//  Created by Paul on 2017-09-19.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "TodoListTableViewCell.h"
#import "AddItemViewController.h"

//add my new delegate onto the array
@interface MasterViewController () <AddItemViewControllerDelegate>
@property(nonatomic)NSMutableArray <Todo*> *todoListArray;


@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    [self createTodoObjects];
    [self.tableView reloadData];
 
}

- (void)viewWillAppear:(BOOL)animated {
}


#pragma mark - Create todo Objects
-(void)createTodoObjects{
    Todo *taskOne = [[Todo alloc]initWithTitle:@"Clean" description:@"Clean the toilet" priorityNumber:2 complete:YES];
    
    
    Todo *taskTwo = [[Todo alloc]initWithTitle:@"Wash" description:@"Wash the dog" priorityNumber:3 complete:NO];
    
    Todo *taskThree = [[Todo alloc]initWithTitle:@"Pass" description:@"Pass IOS Bootcamp" priorityNumber:1 complete:NO];
    
    self.todoListArray = [[NSMutableArray alloc]initWithObjects:taskOne,taskTwo,taskThree, nil];
    
}


#pragma mark - Segues


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        DetailViewController *controller = (DetailViewController*)[segue destinationViewController];
        
        //calling the tableview's property self.tableview (its uitableviewcontroller)
        // calling the method and using the row. this method retrieves the information from the detailedViewController's private property while setting it to detailItem.
        controller.detailItem =  self.todoListArray[self.tableView.indexPathForSelectedRow.row];
        
        }
    
    //this segue saves user's items from AddViewController and adds it to the first view. Saving the delegate to the MasterViewController.
    if ([[segue identifier] isEqualToString:@"addItems"]){
        
        AddItemViewController *addController = [segue destinationViewController];
        addController.addDelegate = self;
    }


}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoListArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //specify todo property of title, priority # etc (because its layer on layer has to access the property of the class that initially created it)
    //need the NSMutableArray<Todo*> *todoListArray else i would have to make the class.title
    cell.titleLabel.text = self.todoListArray[indexPath.row].title;
    cell.descriptionLabel.text = self.todoListArray[indexPath.row].todoDescription;
    
    
    NSInteger priorityNumber = self.todoListArray[indexPath.row].priorityNumber;
    NSString *priority = [NSString stringWithFormat:@"%lu",priorityNumber];
    cell.priorityLabel.text = priority;
    
    
    if (self.todoListArray[indexPath.row].isCompleted){
    
        cell.boolLabel.text = @"DONE";
    } else {
    
        cell.boolLabel.text =@"NOT DONE";
    }
    
    
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


//this adds delete functionality

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.todoListArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


//this method takes the user's answers from the other view, the segue brings it back to this view and this method adds it to the array.
//we also have this method called in AddItemViwController.m to add info from the user's answers;
-(void)addObjectTodo:(Todo*)todo{
    
    [self.todoListArray addObject:todo];
    [self.tableView reloadData];
    
}


@end
