//
//  FilterSelectViewController.h
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/10.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "FilterTypeDelclare.h"

@interface FilterSelectViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, weak) IBOutlet UITableView *tableView;

@end
