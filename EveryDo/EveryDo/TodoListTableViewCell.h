//
//  TodoListTableViewCell.h
//  EveryDo
//
//  Created by Paul on 2017-09-19.
//  Copyright © 2017 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@property (weak, nonatomic) IBOutlet UILabel *boolLabel;



@end
