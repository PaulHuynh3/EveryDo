//
//  DetailViewController.m
//  EveryDo
//
//  Created by Paul on 2017-09-19.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *priorityNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *completeLabel;


@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(Todo*)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

//has to be be put before view did load. So the properties are pass through to other class.
- (void)configureView {
    
    // Update the user interface for the detail item.
    if (self.detailItem) {
        //set private detailDescription  equal to public detailItem.tododescription - because im using its class
        self.detailDescriptionLabel.text = self.detailItem.todoDescription;
        
        //set the number..
        NSInteger number= self.detailItem.priorityNumber;
        NSString *priorityNumber = [NSString stringWithFormat:@"%lu",number];
        self.priorityNumberLabel.text = priorityNumber;
      
        
        
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
