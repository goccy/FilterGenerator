//
//  InitialViewContollerViewController.h
//  FilterGenerator
//
//  Created by masaaki.goshima on 2013/12/09.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#ifndef INITIAL_VIEW_CONTROLLER
#define INITIAL_VIEW_CONTROLLER

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "EditViewController.h"

@interface InitialViewController : BaseViewController {
    IBOutlet UIButton *newFilterButton;
}

- (IBAction)touchDownButton:(id)sender;

@end

#endif