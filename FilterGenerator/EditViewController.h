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
#import "SelectPhotoViewController.h"
#import "SaveViewController.h"

@class FilterView;
@interface EditViewController : BaseViewController

@property (nonatomic, strong) UIImage *editImage;
@property (nonatomic, strong) UIImage *originalImage;
@property (nonatomic, weak) IBOutlet UIImageView *editImageView;
@property (nonatomic, weak) IBOutlet UIView *editView;
@property (nonatomic, strong)   FilterView *filterView;
@property (nonatomic, strong) NSMutableDictionary *filterParameter;

- (IBAction)touchFilterSelectButton:(id)sender;
- (IBAction)touchImageSelectButton:(id)sender;

@end

#endif