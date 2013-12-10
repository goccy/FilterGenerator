//
//  EditViewController.h
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/09.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#ifndef EDIT_VIEW_CONTROLLER
#define EDIT_VIEW_CONTROLLER

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "FilterSelectViewController.h"

@interface EditViewController : BaseViewController

- (IBAction)touchFilterSelectButton:(id)sender;
- (IBAction)touchImageSelectButton:(id)sender;

@end

#endif