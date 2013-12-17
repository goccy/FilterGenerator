//
//  SaveViewController.h
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/16.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface SaveViewController : BaseViewController

@property (nonatomic, weak) IBOutlet UITextField *filterNameArea;
@property (nonatomic, weak) IBOutlet UITextField *codeNameArea;

@end
