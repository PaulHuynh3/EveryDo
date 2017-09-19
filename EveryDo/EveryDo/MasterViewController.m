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

@interface MasterViewController ()
@property (nonatomic) NSMutableArray *objects;
@property(nonatomic)NSMutableArray <Todo*> *todoListArray;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    [self createTodoObjects];
    [self.tableView reloadData];
 
}

- (void)viewWillAppear:(BOOL)animated {
}


- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
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
    
    //you have to specify the todo property of title, priority #, description, completed etc.
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


//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}




/*
 Create a custom UITableViewCell subclass that displays the title, a oner-line preview of the task description, the priority level, and strikethrough text of all othe text if the task is completed. This will require you to implement the delegate and data source methods to display a cell for each todo item.
 */



@end
