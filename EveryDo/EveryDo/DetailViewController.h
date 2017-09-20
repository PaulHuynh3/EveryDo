//
//  DetailViewController.h
//  EveryDo
//
//  Created by Paul on 2017-09-19.
//  Copyright © 2017 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
#import "MasterViewController.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Todo *detailItem;

@end

